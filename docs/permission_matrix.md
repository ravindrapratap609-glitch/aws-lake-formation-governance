# Permission Matrix — NYC Trips Data Lake

## Role Definitions

| Role | Business Purpose | Row Access | Column Access |
|---|---|---|---|
| NYC_Data_Admin | Full data access for admin | All zones | All 28 columns |
| NYC_Finance_Analyst | Revenue and payment analysis | All zones | 17 financial columns |
| NYC_Ops_Analyst | Trip patterns and operations | All zones | 16 operational columns |
| NYC_Regional_Manager | Midtown Manhattan operations | Zone 161 only | 5 location columns |

## Column Access Matrix

| Column | Data_Admin | Finance | Ops | Regional_Manager |
|---|---|---|---|---|
| vendorid | ✅ | ✅ | ✅ | ✅ |
| tpep_pickup_datetime | ✅ | ✅ | ✅ | ✅ |
| tpep_dropoff_datetime | ✅ | ✅ | ✅ | ✅ |
| passenger_count | ✅ | ❌ | ✅ | ❌ |
| trip_distance | ✅ | ❌ | ✅ | ❌ |
| ratecodeid | ✅ | ❌ | ✅ | ❌ |
| store_and_fwd_flag | ✅ | ❌ | ✅ | ❌ |
| pulocationid | ✅ | ❌ | ✅ | ✅ |
| dolocationid | ✅ | ❌ | ✅ | ✅ |
| payment_type | ✅ | ✅ | ❌ | ❌ |
| fare_amount | ✅ | ✅ | ❌ | ❌ |
| extra | ✅ | ✅ | ❌ | ❌ |
| mta_tax | ✅ | ✅ | ❌ | ❌ |
| tip_amount | ✅ | ✅ | ❌ | ❌ |
| tolls_amount | ✅ | ✅ | ❌ | ❌ |
| improvement_surcharge | ✅ | ✅ | ❌ | ❌ |
| total_amount | ✅ | ✅ | ❌ | ❌ |
| congestion_surcharge | ✅ | ✅ | ❌ | ❌ |
| airport_fee | ✅ | ✅ | ❌ | ❌ |
| pickup_hour | ✅ | ❌ | ✅ | ❌ |
| pickup_day_of_week | ✅ | ❌ | ✅ | ❌ |
| pickup_month | ✅ | ✅ | ✅ | ❌ |
| pickup_year | ✅ | ✅ | ✅ | ❌ |
| trip_duration_minutes | ✅ | ❌ | ✅ | ❌ |
| is_peak_hour | ✅ | ❌ | ✅ | ❌ |
| time_of_day | ✅ | ❌ | ✅ | ❌ |
| tip_percentage | ✅ | ✅ | ❌ | ❌ |
| revenue_per_mile | ✅ | ✅ | ❌ | ❌ |

## Row Access Matrix

| Role | Row Filter | Zones Visible | Rows Visible |
|---|---|---|---|
| NYC_Data_Admin | None | All 265 zones | 2,723,762 |
| NYC_Finance_Analyst | TRUE (all rows) | All 265 zones | 2,723,762 |
| NYC_Ops_Analyst | TRUE (all rows) | All 265 zones | 2,723,762 |
| NYC_Regional_Manager | pulocationid = 161 | Zone 161 only | 134,967 |

## Data Filters

| Filter Name | Row Expression | Column Restriction |
|---|---|---|
| midtown-only-filter | pulocationid = 161 | 5 columns |
| ops-analyst-filter | TRUE | 16 columns |
| finance-analyst-filter | TRUE | 17 columns |
```

Commit message:
```
Add permission matrix documentation
