SET NOCOUNT ON;

DECLARE @MaDV   NVARCHAR(20) = N'002';
DECLARE @HomNay DATE = '2026-08-22'
DECLARE @K FLOAT = 100;

IF OBJECT_ID('tempdb..#D') IS NOT NULL DROP TABLE #D;
IF OBJECT_ID('tempdb..#P') IS NOT NULL DROP TABLE #P;

SELECT
    d0 AS d,
    SUM(TRY_CAST(COT_F AS FLOAT)) AS COT_F,
    --SUM(TRY_CAST(COT_G AS FLOAT)) AS COT_G,
    SUM(TRY_CAST(COT_H AS FLOAT)) AS COT_H,
    SUM(TRY_CAST(COT_I AS FLOAT)) AS COT_I,
    SUM(TRY_CAST(COT_J AS FLOAT)) AS COT_J,
    SUM(TRY_CAST(COT_L AS FLOAT)) AS COT_L,
    SUM(TRY_CAST(COT_M AS FLOAT)) AS COT_M,
    SUM(TRY_CAST(COT_Q AS FLOAT)) AS COT_Q,
    SUM(TRY_CAST(COT_R AS FLOAT)) AS COT_R,
    SUM(TRY_CAST(COT_S AS FLOAT)) AS COT_S,
    SUM(TRY_CAST(COT_T AS FLOAT)) AS COT_T,
    SUM(TRY_CAST(COT_U AS FLOAT)) AS COT_U,
    SUM(TRY_CAST(COT_V AS FLOAT)) AS COT_V,
    SUM(TRY_CAST(COT_W AS FLOAT)) AS COT_W,
    --SUM(TRY_CAST(COT_Z AS FLOAT)) AS COT_Z,
    SUM(TRY_CAST(COT_AA AS FLOAT)) AS COT_AA,
    SUM(TRY_CAST(COT_AB AS FLOAT)) AS COT_AB,
    SUM(TRY_CAST(COT_AE AS FLOAT)) AS COT_AE,
    SUM(TRY_CAST(COT_AF AS FLOAT)) AS COT_AF,
    SUM(TRY_CAST(COT_AJ AS FLOAT)) AS COT_AJ,
    SUM(TRY_CAST(COT_AK AS FLOAT)) AS COT_AK,
    SUM(TRY_CAST(COT_AL AS FLOAT)) AS COT_AL,
    SUM(TRY_CAST(COT_AM AS FLOAT)) AS COT_AM,
    SUM(TRY_CAST(COT_AN AS FLOAT)) AS COT_AN,
    SUM(TRY_CAST(COT_AO AS FLOAT)) AS COT_AO,
    SUM(TRY_CAST(COT_AP AS FLOAT)) AS COT_AP,
    --SUM(TRY_CAST(COT_AS AS FLOAT)) AS COT_AS,
    SUM(TRY_CAST(COT_AT AS FLOAT)) AS COT_AT,
    SUM(TRY_CAST(COT_AU AS FLOAT)) AS COT_AU,
    --SUM(TRY_CAST(COT_AW AS FLOAT)) AS COT_AW,
    SUM(TRY_CAST(COT_AX AS FLOAT)) AS COT_AX,
    SUM(TRY_CAST(COT_AY AS FLOAT)) AS COT_AY,
    SUM(TRY_CAST(COT_AZ AS FLOAT)) AS COT_AZ,
    SUM(TRY_CAST(COT_BB AS FLOAT)) AS COT_BB,
    SUM(TRY_CAST(COT_BC AS FLOAT)) AS COT_BC,
    SUM(TRY_CAST(COT_BG AS FLOAT)) AS COT_BG,
    SUM(TRY_CAST(COT_BH AS FLOAT)) AS COT_BH,
    SUM(TRY_CAST(COT_BI AS FLOAT)) AS COT_BI,
    SUM(TRY_CAST(COT_BJ AS FLOAT)) AS COT_BJ,
    SUM(TRY_CAST(COT_BK AS FLOAT)) AS COT_BK,
    SUM(TRY_CAST(COT_BL AS FLOAT)) AS COT_BL,
    SUM(TRY_CAST(COT_BM AS FLOAT)) AS COT_BM,
    SUM(TRY_CAST(COT_BN AS FLOAT)) AS COT_BN,
    SUM(TRY_CAST(COT_BR AS FLOAT)) AS COT_BR,
    SUM(TRY_CAST(COT_BS AS FLOAT)) AS COT_BS,
    SUM(TRY_CAST(COT_BW AS FLOAT)) AS COT_BW,
    SUM(TRY_CAST(COT_BX AS FLOAT)) AS COT_BX,
    SUM(TRY_CAST(COT_BY AS FLOAT)) AS COT_BY,
    SUM(TRY_CAST(COT_BZ AS FLOAT)) AS COT_BZ,
    SUM(TRY_CAST(COT_CA AS FLOAT)) AS COT_CA,
    SUM(TRY_CAST(COT_CB AS FLOAT)) AS COT_CB,
    SUM(TRY_CAST(COT_CC AS FLOAT)) AS COT_CC,
    SUM(TRY_CAST(COT_CF AS FLOAT)) AS COT_CF,
    SUM(TRY_CAST(COT_CG AS FLOAT)) AS COT_CG,
    SUM(TRY_CAST(COT_CH AS FLOAT)) AS COT_CH,
    SUM(TRY_CAST(COT_CI AS FLOAT)) AS COT_CI,
    SUM(TRY_CAST(COT_CJ AS FLOAT)) AS COT_CJ,
    SUM(TRY_CAST(COT_CK AS FLOAT)) AS COT_CK,
    SUM(TRY_CAST(COT_CM AS FLOAT)) AS COT_CM,
    SUM(TRY_CAST(COT_CN AS FLOAT)) AS COT_CN,
    SUM(TRY_CAST(COT_CO AS FLOAT)) AS COT_CO,
    SUM(TRY_CAST(COT_CP AS FLOAT)) AS COT_CP,
    SUM(TRY_CAST(COT_CS AS FLOAT)) AS COT_CS,
    SUM(TRY_CAST(COT_CT AS FLOAT)) AS COT_CT,
    SUM(TRY_CAST(COT_CU AS FLOAT)) AS COT_CU,
    SUM(TRY_CAST(COT_CV AS FLOAT)) AS COT_CV,
    SUM(TRY_CAST(COT_CY AS FLOAT)) AS COT_CY,
    SUM(TRY_CAST(COT_DA AS FLOAT)) AS COT_DA,
    SUM(TRY_CAST(COT_DB AS FLOAT)) AS COT_DB,
    SUM(TRY_CAST(COT_DC AS FLOAT)) AS COT_DC,
    SUM(TRY_CAST(COT_DD AS FLOAT)) AS COT_DD,
    SUM(TRY_CAST(COT_DG AS FLOAT)) AS COT_DG,
    SUM(TRY_CAST(COT_DJ AS FLOAT)) AS COT_DJ,
    SUM(TRY_CAST(COT_DL AS FLOAT)) AS COT_DL,
    SUM(TRY_CAST(COT_DM AS FLOAT)) AS COT_DM,
    SUM(TRY_CAST(COT_DN AS FLOAT)) AS COT_DN,
    SUM(TRY_CAST(COT_DR AS FLOAT)) AS COT_DR,
    SUM(TRY_CAST(COT_EE AS FLOAT)) AS COT_EE,
    SUM(TRY_CAST(COT_ER AS FLOAT)) AS COT_ER,
    SUM(TRY_CAST(COT_FE AS FLOAT)) AS COT_FE,
    SUM(TRY_CAST(COT_FR AS FLOAT)) AS COT_FR,
    SUM(TRY_CAST(COT_GE AS FLOAT)) AS COT_GE,
    SUM(TRY_CAST(COT_GR AS FLOAT)) AS COT_GR,
    SUM(TRY_CAST(COT_HE AS FLOAT)) AS COT_HE,
    SUM(TRY_CAST(COT_HR AS FLOAT)) AS COT_HR,
    SUM(TRY_CAST(COT_IE AS FLOAT)) AS COT_IE,
    SUM(TRY_CAST(COT_II AS FLOAT)) AS COT_II,
    SUM(TRY_CAST(COT_IM AS FLOAT)) AS COT_IM,
    SUM(TRY_CAST(COT_IQ AS FLOAT)) AS COT_IQ,
    SUM(TRY_CAST(COT_IU AS FLOAT)) AS COT_IU,
    SUM(TRY_CAST(COT_IY AS FLOAT)) AS COT_IY,
    SUM(TRY_CAST(COT_JC AS FLOAT)) AS COT_JC,
    SUM(TRY_CAST(COT_JG AS FLOAT)) AS COT_JG,
    SUM(TRY_CAST(COT_JK AS FLOAT)) AS COT_JK,
    SUM(TRY_CAST(COT_JO AS FLOAT)) AS COT_JO,
    SUM(TRY_CAST(COT_JS AS FLOAT)) AS COT_JS,
    SUM(TRY_CAST(COT_JW AS FLOAT)) AS COT_JW,
    SUM(TRY_CAST(COT_KA AS FLOAT)) AS COT_KA,
    SUM(TRY_CAST(COT_KE AS FLOAT)) AS COT_KE,
    SUM(TRY_CAST(COT_KJ AS FLOAT)) AS COT_KJ,
    SUM(TRY_CAST(COT_KN AS FLOAT)) AS COT_KN,
    SUM(TRY_CAST(COT_KR AS FLOAT)) AS COT_KR,
    SUM(TRY_CAST(COT_KV AS FLOAT)) AS COT_KV,
    SUM(TRY_CAST(COT_KZ AS FLOAT)) AS COT_KZ,
    SUM(TRY_CAST(COT_LD AS FLOAT)) AS COT_LD,
    SUM(TRY_CAST(COT_LH AS FLOAT)) AS COT_LH,
    SUM(TRY_CAST(COT_LL AS FLOAT)) AS COT_LL,
    SUM(TRY_CAST(COT_LP AS FLOAT)) AS COT_LP,
    SUM(TRY_CAST(COT_LT AS FLOAT)) AS COT_LT,
    SUM(TRY_CAST(COT_LX AS FLOAT)) AS COT_LX,
    SUM(TRY_CAST(COT_MB AS FLOAT)) AS COT_MB,
    SUM(TRY_CAST(COT_MF AS FLOAT)) AS COT_MF
INTO #D
FROM (
    SELECT *, TRY_CAST(SYM_RUN_DATE AS DATE) AS d0
    FROM dbo.Sheet1
    WHERE (@MaDV IS NULL OR COT_B = @MaDV)
) s
WHERE d0 IS NOT NULL
GROUP BY d0;

DECLARE @T1 DATE = (SELECT MAX(d) FROM #D WHERE d < @HomNay);
DECLARE @T2 DATE = (SELECT MAX(d) FROM #D WHERE d < @T1);

DECLARE @CuoiThangTruoc DATE = EOMONTH(@T1);
DECLARE @Nam INT = YEAR(@CuoiThangTruoc);

;WITH m AS (
    SELECT EOMONTH(DATEFROMPARTS(@Nam, n, 1)) AS CuoiThang
    FROM (VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12)) x(n)
)
SELECT m.CuoiThang, p.*, s.ER_SUM, s.FE_SUM, s.FR_SUM, s.HR_SUM
INTO #P
FROM m
OUTER APPLY (
    SELECT TOP (1) * FROM #D
    WHERE d > EOMONTH(m.CuoiThang, -1) AND d <= m.CuoiThang AND d <= @T1
    ORDER BY d DESC   -- lấy 1 dòng cuối (số tháng giữ nguyên các ngày). Nếu muốn cộng các ngày: đổi TOP(1) thành SUM, xem ghi chú cuối chat
) p
OUTER APPLY (   -- Slide 5: số tháng = TỔNG các ngày trong tháng (đến @T1)
    SELECT SUM(COT_ER) AS ER_SUM, SUM(COT_FE) AS FE_SUM, SUM(COT_FR) AS FR_SUM, SUM(COT_HR) AS HR_SUM
    FROM #D
    WHERE d > EOMONTH(m.CuoiThang, -1) AND d <= m.CuoiThang AND d <= @T1
) s
WHERE m.CuoiThang <= @CuoiThangTruoc;

SELECT @HomNay AS HomNay, @T1 AS T1, @T2 AS T2, @Nam AS Nam, @MaDV AS MaDV;   -- kiểm tra nhanh tham số

--SLIDE 1
SELECT v.STT, v.Metric, v.DonVi, ROUND(v.GiaTri, 4) AS GiaTri
FROM #D a
LEFT JOIN #D b ON b.d = @T2
CROSS APPLY (SELECT
      r1 = (a.COT_AA + a.COT_AT) / NULLIF(a.COT_H, 0),      -- Tỷ lệ CASA t-1
      r2 = (b.COT_AA + b.COT_AT) / NULLIF(b.COT_H, 0)      -- Tỷ lệ CASA t-2
      --r0 = (a.COT_Z  + a.COT_AS) / NULLIF(a.COT_G, 0)       -- Tỷ lệ CASA đầu năm
) r
CROSS APPLY (VALUES
    (1,  N'1', N'Tổng tài sản',                     N'Tỷ đồng', a.COT_F),
    (2,  N'1', N'  So với ngày trước',              N'%', (a.COT_F - b.COT_F) / NULLIF(b.COT_F, 0) * 100),
    (3,  N'2', N'Tổng Huy động TT1',                N'Tỷ đồng', a.COT_H),
    (4,  N'2', N'  % TH/ KH',                       N'%', a.COT_J * @K),
    (5,  N'2', N'  So với ngày trước',              N'%', (a.COT_H - b.COT_H) / NULLIF(b.COT_H, 0) * 100),
    --(6,  N'2', N'  So với đầu năm',                 N'%', (a.COT_H - a.COT_G) / NULLIF(a.COT_G, 0) * 100),

    (7,  N'3', N'CASA',                             N'Tỷ đồng', a.COT_AA + a.COT_AT),
    (8,  N'3', N'  % TH/ KH',                       N'%', (a.COT_AA + a.COT_AT) / NULLIF(a.COT_AB + a.COT_AU, 0) * 100),
    (9,  N'3', N'  So với ngày trước',              N'%', ((a.COT_AA + a.COT_AT) - (b.COT_AA + b.COT_AT)) / NULLIF(b.COT_AA + b.COT_AT, 0) * 100),
    --(10, N'3', N'  So với đầu năm',                 N'%', ((a.COT_AA + a.COT_AT) - (a.COT_Z + a.COT_AS)) / NULLIF(a.COT_Z + a.COT_AS, 0) * 100),

    (11, N'4', N'Tỷ lệ CASA',                       N'%', r.r1 * 100),
    (12, N'4', N'  So với ngày trước',              N'%', (r.r1 - r.r2) / NULLIF(r.r2, 0) * 100),
    --(13, N'4', N'  So với đầu năm',                 N'%', (r.r1 - r.r0) / NULLIF(r.r0, 0) * 100),

    (14, N'5', N'Tổng Cho vay',                     N'Tỷ đồng', a.COT_AX),
    (15, N'5', N'  % TH/ KH',                       N'%', a.COT_AZ * @K),
    (16, N'5', N'  So với ngày trước',              N'%', (a.COT_AX - b.COT_AX) / NULLIF(b.COT_AX, 0) * 100),
    --(17, N'5', N'  So với đầu năm',                 N'%', (a.COT_AX - a.COT_AW) / NULLIF(a.COT_AW, 0) * 100),

    (18, N'6', N'Lợi nhuận lũy kế hệ thống',        N'Tỷ đồng', a.COT_DJ),
    (19, N'6', N'  So với ngày trước',              N'%', (a.COT_DJ - b.COT_DJ) / NULLIF(b.COT_DJ, 0) * 100),
    -- So với đầu năm: "Bắt đầu từ năm sau" => chưa làm

    (20, N'7', N'Nợ quá hạn',                       N'Tỷ đồng', a.COT_CG + a.COT_CH + a.COT_CI + a.COT_CJ),
    (21, N'7', N'  So với ngày trước',              N'%', ((a.COT_CG + a.COT_CH + a.COT_CI + a.COT_CJ) - (b.COT_CG + b.COT_CH + b.COT_CI + b.COT_CJ))
                                                          / NULLIF(b.COT_CG + b.COT_CH + b.COT_CI + b.COT_CJ, 0) * 100),
    (22, N'7', N'Tỷ lệ Nợ quá hạn',                 N'%', a.COT_CP * @K),

    (23, N'8', N'Nợ xấu hệ thống',                  N'Tỷ đồng', a.COT_CK),
    (24, N'8', N'  So với ngày trước',              N'%', (a.COT_CK - b.COT_CK) / NULLIF(b.COT_CK, 0) * 100),
    (25, N'8', N'Tỷ lệ Nợ xấu hệ thống',            N'%', a.COT_CK / NULLIF(a.COT_AX, 0) * 100),

    (26, N'9', N'Nợ xấu đánh giá',                  N'Tỷ đồng', a.COT_CN),
    (27, N'9', N'  So với ngày trước',              N'%', (a.COT_CN - b.COT_CN) / NULLIF(b.COT_CN, 0) * 100),
    (28, N'9', N'Tỷ lệ Nợ xấu đánh giá',            N'%', a.COT_CO * @K)
) v (Ord, STT, Metric, DonVi, GiaTri)
WHERE a.d = @T1
ORDER BY v.Ord;


--SLIDE 2
SELECT v.STT, v.Metric, v.DonVi, ROUND(v.GiaTri, 4) AS GiaTri
FROM #D a
CROSS APPLY (VALUES
    (1,  N'1',  N'Tổng Huy động TT1',        N'Tỷ đồng', a.COT_H),
    (2,  N'1',  N'  % TH/ KH',               N'%', a.COT_J * @K),
    (3,  N'2',  N'Tổng CASA',                N'Tỷ đồng', a.COT_AA + a.COT_AT),
    (4,  N'2',  N'  % TH/ KH',               N'%', (a.COT_AA + a.COT_AT) / NULLIF(a.COT_AB + a.COT_AU, 0) * 100),
    (5,  N'3',  N'Huy động KKH',             N'Tỷ đồng', a.COT_U + a.COT_AN),
    (6,  N'3',  N'Huy động NH',              N'Tỷ đồng', a.COT_V + a.COT_AO),
    (7,  N'3',  N'Huy động TDH',             N'Tỷ đồng', a.COT_W + a.COT_AP),
    (8,  N'4',  N'Huy động VND',             N'Tỷ đồng', a.COT_M + a.COT_AF),
    (9,  N'4',  N'Huy động ngoại tệ',        N'Tỷ đồng', a.COT_Q + a.COT_R + a.COT_S + a.COT_T + a.COT_AJ + a.COT_AK + a.COT_AL + a.COT_AM),
    (10, N'5',  N'Huy động NHDN',            N'Tỷ đồng', a.COT_L),
    (11, N'5',  N'Huy động NHBL',            N'Tỷ đồng', a.COT_AE),
    (12, N'8',  N'Tổng Cho vay',             N'Tỷ đồng', a.COT_AX),
    (13, N'8',  N'  % TH/ KH',               N'%', a.COT_AZ * @K),
    (14, N'9',  N'TPDN',                     N'Tỷ đồng', a.COT_BN),
    (15, N'10', N'Cho vay NH',               N'Tỷ đồng', a.COT_BK + a.COT_CA),
    (16, N'10', N'Cho vay TH',               N'Tỷ đồng', a.COT_BL + a.COT_CB),
    (17, N'10', N'Cho vay DH',               N'Tỷ đồng', a.COT_BM + a.COT_CC),
    (18, N'11', N'Cho vay VND',              N'Tỷ đồng', a.COT_BC + a.COT_BS),
    (19, N'11', N'Cho vay ngoại tệ',         N'Tỷ đồng', a.COT_BG + a.COT_BH + a.COT_BI + a.COT_BJ + a.COT_BW + a.COT_BX + a.COT_BY + a.COT_BZ),
    (20, N'12', N'Cho vay NHDN',             N'Tỷ đồng', a.COT_BB),
    (21, N'12', N'Cho vay NHBL',             N'Tỷ đồng', a.COT_BR),
    (22, N'14', N'N1 - Nợ đủ tiêu chuẩn',        N'Tỷ đồng', a.COT_CF),
    (23, N'14', N'N2 - Nợ cần chú ý',            N'Tỷ đồng', a.COT_CG),
    (24, N'14', N'N3 - Nợ dưới tiêu chuẩn',      N'Tỷ đồng', a.COT_CH),
    (25, N'14', N'N4 - Nợ nghi ngờ',             N'Tỷ đồng', a.COT_CI),
    (26, N'14', N'N5 - Nợ có khả năng mất vốn',  N'Tỷ đồng', a.COT_CJ)
) v (Ord, STT, Metric, DonVi, GiaTri)
WHERE a.d = @T1
ORDER BY v.Ord;

-- (B) Biểu đồ 6: Tổng Huy động TT1 theo ngày (10 ngày tính từ ngày filter @T1 trở về trước)
SELECT d AS Ngay,
       ROUND(COT_H, 4)      AS Line1_ThucHien_TyDong,
       ROUND(COT_I, 4)      AS Line2_KeHoachThang_TyDong,
       ROUND(COT_J * @K, 4) AS Line3_PhanTram_TH_KH
FROM #D
WHERE d BETWEEN DATEADD(DAY, -10, @T1) AND @T1
ORDER BY d;

-- (C) Biểu đồ 7: Tổng CASA theo ngày
SELECT d AS Ngay,
       ROUND(COT_AA + COT_AT, 4)                                                   AS Line1_ThucHien_TyDong,
       ROUND(COT_AB + COT_AU, 4)                                                   AS Line2_KeHoachThang_TyDong,
       ROUND((COT_AA + COT_AT) / NULLIF(COT_AB + COT_AU, 0) * 100, 4)              AS Line3_PhanTram_TH_KH
FROM #D
WHERE d BETWEEN DATEADD(DAY, -10, @T1) AND @T1
ORDER BY d;

-- (D) Biểu đồ 13: Tổng Cho vay theo ngày
SELECT d AS Ngay,
       ROUND(COT_AX, 4)      AS Line1_ThucHien_TyDong,
       ROUND(COT_AY, 4)      AS Line2_KeHoachThang_TyDong,
       ROUND(COT_AZ * @K, 4) AS Line3_PhanTram_TH_KH
FROM #D
WHERE d BETWEEN DATEADD(DAY, -10, @T1) AND @T1
ORDER BY d;


--SLIDE 3
SELECT v.Nhom, v.Metric, v.DonVi, ROUND(v.GiaTri, 4) AS GiaTri
FROM #D a
CROSS APPLY (VALUES
    -- 1. Nợ xấu hệ thống
    (1,  N'1. Nợ xấu hệ thống', N'Nợ quá hạn',                        N'Tỷ đồng', a.COT_CG + a.COT_CH + a.COT_CI + a.COT_CJ),
    (2,  N'1. Nợ xấu hệ thống', N'Nợ xấu định lượng',                 N'Tỷ đồng', a.COT_CK),
    (3,  N'1. Nợ xấu hệ thống', N'Bán nợ',                            N'Tỷ đồng', a.COT_CM),
    (4,  N'1. Nợ xấu hệ thống', N'Nợ xấu (bao gồm bán nợ)',           N'Tỷ đồng', a.COT_CK + a.COT_CM),
    (5,  N'1. Nợ xấu hệ thống', N'Tỷ lệ Nợ quá hạn',                  N'%', a.COT_CP * @K),
    (6,  N'1. Nợ xấu hệ thống', N'Tỷ lệ Nợ xấu (bao gồm bán nợ)',     N'%', (a.COT_CK + a.COT_CM) / NULLIF(a.COT_AX + a.COT_CM, 0) * 100),
    -- 2. Nợ xấu đánh giá
    (7,  N'2. Nợ xấu đánh giá', N'Nợ xấu đánh giá (gồm NXDC + bán nợ)', N'Tỷ đồng', a.COT_CN),
    (8,  N'2. Nợ xấu đánh giá', N'Tỷ lệ Nợ xấu đánh giá',             N'%', a.COT_CO * @K),
    -- 3. NHDN
    (9,  N'3. Nợ xấu theo NHDN', N'Nợ quá hạn',                       N'Tỷ đồng', a.COT_CS + a.COT_CT + a.COT_CU + a.COT_CV),
    (10, N'3. Nợ xấu theo NHDN', N'Nợ xấu định lượng',                N'Tỷ đồng', a.COT_CT + a.COT_CU + a.COT_CV),
    (11, N'3. Nợ xấu theo NHDN', N'Tỷ lệ Nợ xấu định lượng',          N'%', (a.COT_CT + a.COT_CU + a.COT_CV) / NULLIF(a.COT_BB, 0) * 100),
    (12, N'3. Nợ xấu theo NHDN', N'Tỷ lệ Nợ xấu (bao gồm bán nợ)',    N'%', a.COT_CY * @K),
    -- 4. NHBL
    (13, N'4. Nợ xấu theo NHBL', N'Nợ quá hạn',                       N'Tỷ đồng', a.COT_DA + a.COT_DB + a.COT_DC + a.COT_DD),
    (14, N'4. Nợ xấu theo NHBL', N'Nợ xấu định lượng',                N'Tỷ đồng', a.COT_DB + a.COT_DC + a.COT_DD),
    (15, N'4. Nợ xấu theo NHBL', N'Tỷ lệ Nợ xấu định lượng',          N'%', (a.COT_DB + a.COT_DC + a.COT_DD) / NULLIF(a.COT_BR, 0) * 100),
    (16, N'4. Nợ xấu theo NHBL', N'Tỷ lệ Nợ xấu (bao gồm bán nợ)',    N'%', a.COT_DG * @K)
) v (Ord, Nhom, Metric, DonVi, GiaTri)
WHERE a.d = @T1
ORDER BY v.Ord;

-- (B) Biểu đồ 5: Tỷ lệ Nợ xấu (bao gồm bán nợ) hàng ngày theo khối (NHDN, NHBL 2 màu)
SELECT d AS Ngay,
       ROUND(COT_CY * @K, 4) AS NHDN_TyLe_Percent,
       ROUND(COT_DG * @K, 4) AS NHBL_TyLe_Percent
FROM #D
WHERE d BETWEEN DATEADD(DAY, -10, @T1) AND @T1
ORDER BY d;

-- (C) Biểu đồ 6: Tỷ lệ Nợ xấu đánh giá hàng ngày
SELECT d AS Ngay, ROUND(COT_CO * @K, 4) AS TyLe_NoXauDanhGia_Percent
FROM #D
WHERE d BETWEEN DATEADD(DAY, -10, @T1) AND @T1
ORDER BY d;


--SLIDE 4
DECLARE @ThuNhapLaiThuan  FLOAT = NULL;   -- CHỜ BRD v2 (bảng khác)
DECLARE @LaiLoCKKD        FLOAT = NULL;   -- Lãi/lỗ thuần từ mua bán CK kinh doanh   - CHỜ BRD v2
DECLARE @LaiLoCKDT        FLOAT = NULL;   -- Lãi/lỗ thuần từ mua bán CK đầu tư       - CHỜ BRD v2
DECLARE @LaiLoKhac        FLOAT = NULL;   -- Lãi/lỗ thuần từ hoạt động khác         - CHỜ BRD v2
DECLARE @ThuNhapGopVon    FLOAT = NULL;   -- Thu nhập từ góp vốn mua cổ phần        - CHỜ BRD v2
DECLARE @ChiPhiHoatDong   FLOAT = NULL;   -- Chi phí hoạt động                      - CHỜ BRD v2
DECLARE @ChiPhiDuPhong    FLOAT = NULL;   -- Chi phí dự phòng rủi ro tín dụng       - CHỜ BRD v2

SELECT v.Ord, v.ThanhPhan, v.Loai, v.DonVi, ROUND(v.GiaTri, 4) AS GiaTri
FROM #D a
CROSS APPLY (VALUES
    (1,  N'Thu nhập lãi thuần',                              N'Tăng', N'Tỷ đồng', @ThuNhapLaiThuan),
    (2,  N'Lãi/ lỗ thuần từ hoạt động dịch vụ',              N'Tăng', N'Tỷ đồng', a.COT_DR),
    (3,  N'Lãi/ lỗ thuần từ HĐ kinh doanh ngoại hối',        N'Tăng', N'Tỷ đồng', a.COT_EE),
    (4,  N'Lãi/ lỗ thuần từ mua bán CK kinh doanh',          N'Tăng', N'Tỷ đồng', @LaiLoCKKD),
    (5,  N'Lãi/ lỗ thuần từ mua bán CK đầu tư',              N'Tăng', N'Tỷ đồng', @LaiLoCKDT),
    (6,  N'Lãi/ lỗ thuần từ hoạt động khác',                 N'Tăng', N'Tỷ đồng', @LaiLoKhac),
    (7,  N'Thu nhập từ góp vốn mua cổ phần',                 N'Tăng', N'Tỷ đồng', @ThuNhapGopVon),
    (8,  N'Chi phí hoạt động',                               N'Giảm', N'Tỷ đồng', -@ChiPhiHoatDong),
    (9,  N'Chi phí dự phòng rủi ro tín dụng',                N'Giảm', N'Tỷ đồng', -@ChiPhiDuPhong),
    (10, N'Tổng lợi nhuận trước thuế',                       N'Tổng', N'Tỷ đồng',
         @ThuNhapLaiThuan + a.COT_DR + a.COT_EE + @LaiLoCKKD + @LaiLoCKDT + @LaiLoKhac + @ThuNhapGopVon
         - @ChiPhiHoatDong - @ChiPhiDuPhong)
) v (Ord, ThanhPhan, Loai, DonVi, GiaTri)
WHERE a.d = @T1
ORDER BY v.Ord;

-- (B) Biểu đồ 2: Lợi nhuận hệ thống hàng ngày (lũy kế) - chỉ 1 line DJ, bỏ line KH và % TH/KH
SELECT d AS Ngay, ROUND(COT_DJ, 4) AS LoiNhuanLuyKe_TyDong
FROM #D
WHERE d BETWEEN DATEADD(DAY, -10, @T1) AND @T1
ORDER BY d;

-- (C) Biểu đồ 3: Lợi nhuận thực hàng tháng (lũy kế) - 12 tháng, cuối tháng (31/01, 28/02, ...)
SELECT CuoiThang AS Thang,
       ROUND(COT_DL, 4)      AS Line1_LoiNhuanThucLuyKe_TyDong,
       ROUND(COT_DM, 4)      AS Line2_KeHoachThang_TyDong,
       ROUND(COT_DN * @K, 4) AS Line3_PhanTram_TH_KH
FROM #P
ORDER BY CuoiThang;


--SLIDE 5
SELECT v.STT, v.Metric, v.DonVi, p.CuoiThang AS Thang, ROUND(v.GiaTri, 4) AS GiaTri
FROM #P p
CROSS APPLY (VALUES
    (1, N'Doanh số mua bán ngoại tệ (Triệu USD)',        N'Triệu USD', p.ER_SUM),
    (2, N'Doanh số bảo hiểm nhân thọ (Tỷ đồng)',         N'Tỷ đồng',   p.FE_SUM),
    (3, N'Doanh số bảo hiểm phi nhân thọ (Tỷ đồng)',     N'Tỷ đồng',   p.FR_SUM),
    (4, N'Số lượng khách hàng (Khách hàng)',             N'Khách hàng', p.COT_GE),
    (5, N'Số lượng khách hàng active (Khách hàng)',      N'Khách hàng', p.COT_GR),
    (6, N'Tỷ lệ khách hàng active (%)',                  N'%',         p.COT_HE * @K),
    (7, N'Số lượng giao dịch qua kênh số (Triệu GD)',    N'Triệu GD',  p.HR_SUM)
) v (STT, Metric, DonVi, GiaTri)
ORDER BY v.STT, p.CuoiThang;
SELECT N'Các chỉ tiêu phụ là số liệu chốt tháng, được upload hàng tháng từ ngày 11 đến ngày 15 tháng tiếp theo' AS GhiChu;


--SLIDE 6
SELECT v.STT, v.Metric, v.DonVi, p.CuoiThang AS Thang, ROUND(v.GiaTri, 4) AS GiaTri
FROM #P p
CROSS APPLY (VALUES
    (1,  N'Doanh số TTQT (Triệu USD)',                    N'Triệu USD',  p.COT_IE),
    (2,  N'SL KHDN SD DV QLDT (Khách hàng)',              N'Khách hàng', p.COT_II),
    (3,  N'SL KHDN chuỗi (Khách hàng)',                   N'Khách hàng', p.COT_IM),
    (4,  N'Dư nợ tín dụng chuỗi (Tỷ đồng)',               N'Tỷ đồng',    p.COT_IQ),
    (5,  N'SL KHDN SD DI HDBIZ (Khách hàng)',             N'Khách hàng', p.COT_IU),
    (6,  N'SLKH tín dụng DN (Khách hàng)',                N'Khách hàng', p.COT_IY),
    (7,  N'SL KHDN chi lương (Khách hàng)',               N'Khách hàng', p.COT_JC),
    (8,  N'SDBQCASA/ KHDN chi lương (Tỷ đồng)',           N'Tỷ đồng',    p.COT_JG),
    (9,  N'SL KHCN nhận lương (Khách hàng)',              N'Khách hàng', p.COT_JK),
    (10, N'SLSP BQ/ KHDN (Sản phẩm)',                     N'Sản phẩm',   p.COT_JO),
    (11, N'Tỷ lệ giao dịch qua kênh số DN (%)',           N'%',          p.COT_JS * @K),
    (12, N'SLKH PEB (Khách hàng)',                        N'Khách hàng', p.COT_JW),
    (13, N'Số dư CASA KH PEB (Tỷ đồng)',                  N'Tỷ đồng',    p.COT_KA),
    (14, N'SDBQCASA/ KH PEB (Tỷ đồng)',                   N'Tỷ đồng',    p.COT_KE)
) v (STT, Metric, DonVi, GiaTri)
ORDER BY v.STT, p.CuoiThang;
SELECT N'Các chỉ tiêu phụ là số liệu chốt tháng, được upload hàng tháng từ ngày 11 đến ngày 15 tháng tiếp theo' AS GhiChu;


--SLIDE 7
SELECT v.STT, v.Metric, v.DonVi, p.CuoiThang AS Thang, ROUND(v.GiaTri, 4) AS GiaTri
FROM #P p
CROSS APPLY (VALUES
    (1,  N'SL User Ebanking KHCN (Khách hàng)',               N'Khách hàng', p.COT_KJ),
    (2,  N'Bán chéo TKTT KHDN (Tài khoản)',                   N'Tài khoản',  p.COT_KN),
    (3,  N'SLKH điểm lẻ (Khách hàng)',                        N'Khách hàng', p.COT_KR),
    (4,  N'SDBQCASA/ KH điểm lẻ (Tỷ đồng)',                   N'Tỷ đồng',    p.COT_KV),
    (5,  N'Tỷ lệ K2 (%)',                                     N'%',          p.COT_KZ * @K),
    (6,  N'Tỷ lệ TKTK trên app/ số hóa tại quầy (%)',         N'%',          p.COT_LD * @K),
    (7,  N'Số dư thu hộ TPDN (Tỷ đồng)',                      N'Tỷ đồng',    p.COT_LH),
    (8,  N'SLSP BQ/ KHCN (Sản phẩm)',                         N'Sản phẩm',   p.COT_LL),
    (9,  N'Tỷ lệ giao dịch qua kênh số CN (%)',               N'%',          p.COT_LP * @K),
    (10, N'SDBQCASA/ KHCN nhận lương (Triệu đồng)',           N'Triệu đồng', p.COT_LT),
    (11, N'SLKH đặc biệt (Khách hàng)',                       N'Khách hàng', p.COT_LX),
    (12, N'Quy mô AUM KH đặc biệt (Tỷ đồng)',                 N'Tỷ đồng',    p.COT_MB),
    (13, N'SL thẻ tín dụng đã kích hoạt - lũy kế (Thẻ)',      N'Thẻ',        p.COT_MF)
) v (STT, Metric, DonVi, GiaTri)
ORDER BY v.STT, p.CuoiThang;
SELECT N'Các chỉ tiêu phụ là số liệu chốt tháng, được upload hàng tháng từ ngày 11 đến ngày 15 tháng tiếp theo' AS GhiChu;

DROP TABLE #D;
DROP TABLE #P;
