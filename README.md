# Branch Performance Dashboard: Data Preparation

## Overview

This repository contains the Python/Pandas script used to prepare data for a Power BI management reporting dashboard for business units (DVKD). It reads the source Excel report (.xlsm, multiple sheets) from the planning and business department and builds a clean data model: a business unit dimension table and a transaction fact table.

The outputs are loaded into Power BI, where Measures/DAX and the dashboard pages are built according to the BRD.

### What the script does

| Step | Description |
|------|-------------|
| 1. Build `dim_donvi` | Reads the unit catalog from the source sheet and rebuilds the hierarchy **Cluster (Cụm) → Branch (CN) → Sub-branch (PGD)**. Unit level is identified from the unit name, then parent-child links and the region (KV) are resolved for every unit. |
| 2. Build fact table | Reads the detail sheet, keeps only leaf-level units (removes Cluster subtotal rows and legend tables), and drops unused columns. |
| 3. Data quality checks | Prints row counts before and after filtering, and warns about fact rows whose unit code does not exist in `dim_donvi`. |

### Outputs

- `dim_donvi.xlsx`: unit dimension (unit code, name, level, region, parent branch, parent cluster)
- `fact_giaodich.xlsx`: transaction fact data linked to the dimension by `ma_donvi`

### Dashboard context

The prepared data supports a 7-page Power BI dashboard (Overview, Scale, Non-performing loans, Profit, and supplementary indicators for the whole bank, corporate banking and retail banking), with synchronized slicers, navigation sidebar and bookmarks.

### Tools

Python (Pandas), Microsoft Excel, Microsoft Power BI.

### Usage

1. Place the source Excel report in the same folder as the script and set `FILE_PATH` and `SHEET_NAME` at the top of `fact.py`.
2. Install dependencies: `pip install pandas openpyxl`
3. Run: `python fact.py`
