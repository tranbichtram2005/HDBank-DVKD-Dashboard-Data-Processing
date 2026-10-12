import re
import pandas as pd

FILE_PATH = "Báo cáo ngày 30.04.2026 NOTE CÔNG THỨC final.xlsm"
SHEET_NAME = "Chi tiet"

DANHMUC_SKIPROWS = 25
DANHMUC_USECOLS = "B:D"

FACT_HEADER_ROW_IDX = 2
FACT_DATA_START_IDX = 25

COL_MA = "Mã"
COL_TEN = "Tên đơn vị"
COL_KV = "KV"

COLS_DROP_DEFAULT = ["STT", COL_TEN, COL_KV]
COLS_DROP_EXTRA = [
    "Ngày thành lập",
]


def raw_keyword_type(ten_donvi: str) -> str:
    ten = str(ten_donvi).strip()
    if re.search(r"\bCụm\b", ten, flags=re.IGNORECASE):
        return "CUM"
    if re.search(r"\bPGD\b", ten, flags=re.IGNORECASE) or re.search(r"\bCN\b", ten, flags=re.IGNORECASE):
        return "DONVI"
    return "KHAC"


def build_parent_chain(df: pd.DataFrame, col_ma: str, col_ten: str, col_kv: str = None) -> pd.DataFrame:
    df = df.reset_index(drop=True).copy()
    df["_kw"] = df[col_ten].apply(raw_keyword_type)

    cap_do_list, ma_cha_list, ten_cha_list, kv_final_list = [], [], [], []
    current_cum = None
    current_cn = None
    waiting_for_head = False
    current_kv = None

    for _, row in df.iterrows():
        ma, ten, kw = row[col_ma], row[col_ten], row["_kw"]
        kv_val = row[col_kv] if col_kv else None

        if kw == "CUM":
            cap_do_list.append("CUM")
            ma_cha_list.append(None)
            ten_cha_list.append(None)
            kv_final_list.append(None)
            current_cum = (ma, ten)
            current_cn = None
            waiting_for_head = True
            current_kv = None

        elif kw == "KHAC":
            cap_do_list.append("KHAC")
            ma_cha_list.append(None)
            ten_cha_list.append(None)
            kv_final_list.append(kv_val)
            current_cum = None
            current_cn = None
            waiting_for_head = False

        else:
            if waiting_for_head:
                cap_do_list.append("CN")
                cha = current_cum
                ma_cha_list.append(cha[0] if cha else None)
                ten_cha_list.append(cha[1] if cha else None)
                current_cn = (ma, ten)
                current_kv = kv_val
                kv_final_list.append(kv_val)
                waiting_for_head = False
            elif current_cn is not None:
                cap_do_list.append("PGD")
                ma_cha_list.append(current_cn[0])
                ten_cha_list.append(current_cn[1])
                kv_final_list.append(kv_val if kv_val else current_kv)
            else:
                cap_do_list.append("CN")
                ma_cha_list.append(None)
                ten_cha_list.append(None)
                current_cn = (ma, ten)
                current_kv = kv_val
                kv_final_list.append(kv_val)

    df["cap_do"] = cap_do_list
    df["ma_cha"] = ma_cha_list
    df["ten_cha"] = ten_cha_list
    df["kv"] = kv_final_list
    return df.drop(columns=["_kw"])


def resolve_full_hierarchy(df_long: pd.DataFrame, col_ma: str, col_ten: str) -> pd.DataFrame:
    ma_to_row = df_long.set_index(col_ma).to_dict("index")
    ma_cn_list, ten_cn_list, ma_cum_list, ten_cum_list = [], [], [], []

    for _, row in df_long.iterrows():
        ma, cap = row[col_ma], row["cap_do"]
        ma_cn = ten_cn = ma_cum = ten_cum = None

        if cap == "CN":
            ma_cn, ten_cn = ma, row[col_ten]
            cha = row["ma_cha"]
            if cha is not None and not pd.isna(cha):
                cha_info = ma_to_row[cha]
                if cha_info["cap_do"] == "CUM":
                    ma_cum, ten_cum = cha, cha_info[col_ten]

        elif cap == "PGD":
            cha = row["ma_cha"]
            if cha is not None and not pd.isna(cha):
                cn_info = ma_to_row[cha]
                ma_cn, ten_cn = cha, cn_info[col_ten]
                grandpa = cn_info["ma_cha"]
                if grandpa is not None and not pd.isna(grandpa):
                    cum_info = ma_to_row[grandpa]
                    if cum_info["cap_do"] == "CUM":
                        ma_cum, ten_cum = grandpa, cum_info[col_ten]

        elif cap == "CUM":
            ma_cum, ten_cum = ma, row[col_ten]

        ma_cn_list.append(ma_cn)
        ten_cn_list.append(ten_cn)
        ma_cum_list.append(ma_cum)
        ten_cum_list.append(ten_cum)

    df_out = df_long.copy()
    df_out["ma_cn"] = ma_cn_list
    df_out["ten_cn"] = ten_cn_list
    df_out["ma_cum"] = ma_cum_list
    df_out["ten_cum"] = ten_cum_list
    return df_out


def build_dim_donvi(df_danhmuc: pd.DataFrame, col_ma=COL_MA, col_ten=COL_TEN, col_kv=COL_KV) -> pd.DataFrame:
    df_long = build_parent_chain(df_danhmuc, col_ma, col_ten, col_kv)
    df_resolved = resolve_full_hierarchy(df_long, col_ma, col_ten)
    df_final = df_resolved.rename(columns={col_ma: "ma_donvi", col_ten: "ten_donvi"})
    df_final = df_final[["ma_donvi", "ten_donvi", "cap_do", "kv", "ma_cn", "ten_cn", "ma_cum", "ten_cum"]]
    return df_final


def load_danhmuc_donvi(file_path=FILE_PATH, sheet_name=SHEET_NAME) -> pd.DataFrame:
    df = pd.read_excel(
        file_path, sheet_name=sheet_name, header=None,
        skiprows=DANHMUC_SKIPROWS, usecols=DANHMUC_USECOLS,
        names=[COL_MA, COL_TEN, COL_KV], dtype=str,
    )
    df[COL_MA] = df[COL_MA].str.strip()
    df[COL_TEN] = df[COL_TEN].str.strip()
    df = df.dropna(subset=[COL_MA]).reset_index(drop=True)
    return df


def load_fact_raw(file_path=FILE_PATH, sheet_name=SHEET_NAME) -> pd.DataFrame:
    raw = pd.read_excel(file_path, sheet_name=sheet_name, header=None)
    header_values = raw.iloc[FACT_HEADER_ROW_IDX].tolist()
    df = raw.iloc[FACT_DATA_START_IDX:].reset_index(drop=True)
    df.columns = header_values

    df[COL_MA] = df[COL_MA].astype(str).str.strip()
    if COL_TEN in df.columns:
        df[COL_TEN] = df[COL_TEN].astype(str).str.strip()
    df = df.dropna(subset=[COL_MA]).reset_index(drop=True)
    df = df[df[COL_MA].str.lower() != "nan"].reset_index(drop=True)
    return df


def filter_leaf_rows(df_fact_raw: pd.DataFrame, df_dim_donvi: pd.DataFrame) -> pd.DataFrame:
    valid_ma = set(df_dim_donvi.loc[df_dim_donvi["cap_do"] != "CUM", "ma_donvi"])

    before = len(df_fact_raw)
    df_filtered = df_fact_raw[df_fact_raw[COL_MA].isin(valid_ma)].copy()
    after = len(df_filtered)

    print(f"Số dòng trước khi lọc: {before}")
    print(f"Số dòng sau khi lọc (bỏ Cụm + bảng chú giải KV): {after}")
    print(f"Đã loại: {before - after} dòng")

    all_dim_ma = set(df_dim_donvi["ma_donvi"])
    orphan = df_fact_raw[~df_fact_raw[COL_MA].isin(all_dim_ma)]
    if len(orphan) > 0:
        print(f"\n⚠ CẢNH BÁO: {len(orphan)} dòng trong fact có Mã KHÔNG tồn tại "
              f"trong dim_donvi ở bất kỳ cấp nào. Xem lại các mã sau:")
        print(orphan[[COL_MA, COL_TEN]].drop_duplicates().to_string(index=False))

    return df_filtered.reset_index(drop=True)


def drop_unused_columns(df: pd.DataFrame, extra_drop=None) -> pd.DataFrame:
    extra_drop = extra_drop or []
    all_drop = COLS_DROP_DEFAULT + extra_drop
    cols_to_drop = [c for c in all_drop if c in df.columns]
    missing = [c for c in all_drop if c not in df.columns]
    if missing:
        print(f"⚠ Các cột định xóa nhưng KHÔNG tìm thấy trong data: {missing}")

    df_out = df.drop(columns=cols_to_drop)
    df_out = df_out.rename(columns={COL_MA: "ma_donvi"})
    return df_out


def build_fact(df_dim_donvi: pd.DataFrame) -> pd.DataFrame:
    df_raw = load_fact_raw()
    print(f"Tổng số cột đọc được từ A3:DO3: {len(df_raw.columns)}")
    print(f"Danh sách cột: {list(df_raw.columns)}\n")

    df_leaf = filter_leaf_rows(df_raw, df_dim_donvi)
    df_final = drop_unused_columns(df_leaf, extra_drop=COLS_DROP_EXTRA)

    print(f"\nSố cột sau khi xóa cột không dùng: {len(df_final.columns)}")
    print(f"Số dòng fact cuối cùng: {len(df_final)}")
    return df_final


if __name__ == "__main__":
    print(">>> BƯỚC 1: Build dim_donvi")
    df_danhmuc = load_danhmuc_donvi()
    df_dim_donvi = build_dim_donvi(df_danhmuc)
    df_dim_donvi.to_excel("dim_donvi.xlsx", index=False)
    print(f"Đã xuất dim_donvi.xlsx - {len(df_dim_donvi)} dòng\n")

    print(">>> BƯỚC 2: Build fact")
    df_fact = build_fact(df_dim_donvi)
    df_fact.to_excel("fact_giaodich.xlsx", index=False)
    print("Đã xuất fact_giaodich.xlsx")