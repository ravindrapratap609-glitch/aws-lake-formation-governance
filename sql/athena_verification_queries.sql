-- ============================================
-- Lake Formation Verification Queries
-- Run as each role to verify permissions
-- ============================================

-- Test 1: Count rows (run as each role)
-- NYC_Regional_Manager → should return ~134,967
-- NYC_Ops_Analyst      → should return 2,723,762
-- NYC_Finance_Analyst  → should return 2,723,762
-- NYC_Data_Admin       → should return 2,723,762
SELECT COUNT(*) FROM processed_yellow_trips;

-- Test 2: Check visible columns (run as each role)
SELECT * FROM processed_yellow_trips LIMIT 10;

-- Test 3: Top zones (run as NYC_Regional_Manager)
-- Should only show zone 161
SELECT pulocationid, COUNT(*) as trips
FROM processed_yellow_trips
GROUP BY pulocationid;

-- Test 4: Financial summary (run as NYC_Finance_Analyst)
-- Should show financial columns
SELECT
    ROUND(AVG(fare_amount), 2)    AS avg_fare,
    ROUND(AVG(tip_amount), 2)     AS avg_tip,
    ROUND(AVG(total_amount), 2)   AS avg_total,
    ROUND(AVG(tip_percentage), 2) AS avg_tip_pct
FROM processed_yellow_trips;

-- Test 5: Operations summary (run as NYC_Ops_Analyst)
-- Should show operational columns
SELECT
    time_of_day,
    COUNT(*)                         AS total_trips,
    ROUND(AVG(trip_distance), 2)     AS avg_distance,
    ROUND(AVG(trip_duration_minutes),2) AS avg_duration
FROM processed_yellow_trips
GROUP BY time_of_day
ORDER BY total_trips DESC;
```

Commit message:
```
Add Lake Formation verification queries
```

---

**File 3 — docs/permission_matrix.md**

Filename:
```
docs/permission_matrix.md
