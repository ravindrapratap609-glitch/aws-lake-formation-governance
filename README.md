# AWS Lake Formation Governance

## Overview
Production-grade data governance implementation using AWS Lake Formation.
Column-level and row-level security applied to NYC Yellow Taxi trip data
with four distinct roles having different data access permissions.

## Architecture
```
NYC Trips Data (S3 + Glue Catalog)
         ↓
AWS Lake Formation (Governance Layer)
         ↓
    ┌────┴────────────────────────────┐
    ↓         ↓           ↓          ↓
NYC_Data  NYC_Finance  NYC_Ops  NYC_Regional
 Admin     Analyst     Analyst   Manager
(all)    (financial)  (ops)    (zone 161)
```

## Governance Implementation

### Column-Level Security
Each role sees only the columns relevant to their business function.
Financial columns hidden from operations team.
Location columns hidden from finance team.

### Row-Level Security
Regional Manager restricted to Zone 161 (Midtown Manhattan) only.
Sees 134,967 rows out of 2,723,762 total.

## Tech Stack
- AWS Lake Formation — governance and access control
- AWS Glue Data Catalog — metadata management
- Amazon Athena — query engine
- Amazon S3 — data storage
- AWS IAM — identity management

## Key Results

| Role | Rows Visible | Columns Visible |
|---|---|---|
| NYC_Data_Admin | 2,723,762 | 28 |
| NYC_Finance_Analyst | 2,723,762 | 17 |
| NYC_Ops_Analyst | 2,723,762 | 16 |
| NYC_Regional_Manager | 134,967 | 5 |

## Critical Lesson Learned
IAMAllowedPrincipals is automatically created when Lake Formation
is first enabled. It grants all IAM principals full access and
bypasses all column restrictions. Always revoke it immediately
after enabling Lake Formation.

## Repository Structure
- docs/ — permission matrix and architecture documentation
- sql/ — verification queries for each role
- screenshots/ — implementation evidence

## How to Replicate
1. Enable Lake Formation on AWS account
2. Register S3 location with Lake Formation role
3. Revoke IAMAllowedPrincipals from all tables and databases
4. Create IAM roles for each user type
5. Create data filters with row + column restrictions
6. Grant data filters to each role
7. Verify with Athena queries per role
```

Commit message:
```
Add complete README with architecture and results
```

---

**Step 3 — Upload screenshots**

Go to `screenshots/` folder → **"Add file"** → **"Upload files"**

Upload these screenshots:
```
01_lake_formation_admin_setup.png
02_s3_location_registered.png
03_data_permissions_overview.png
04_regional_manager_5_columns.png
05_regional_manager_134967_rows.png
06_ops_analyst_columns.png
07_ops_analyst_2723762_rows.png
08_finance_analyst_columns.png
09_finance_analyst_2723762_rows.png
```

Commit message:
```
Add governance verification screenshots
```

---

**Final repository structure:**
```
aws-lake-formation-governance/
├── README.md
├── docs/
│   └── permission_matrix.md
├── sql/
│   └── athena_verification_queries.sql
└── screenshots/
    └── *.png files
