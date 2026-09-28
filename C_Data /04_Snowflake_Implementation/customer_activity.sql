-- ============================================================
-- CUSTOMER ACTIVITY IMPLEMENTATION
-- Banking Customer Activity Analysis
-- ============================================================

-- 1. Create the target analytical table
CREATE OR REPLACE TABLE CUSTOMER_ACTIVITY (
    CUSTOMER_ID NUMBER,
    AGE NUMBER,
    CUSTOMER_TYPE TEXT,
    CITY TEXT,
    REGION TEXT,
    BRANCH_ID NUMBER,
    BANK_NAME TEXT,
    ANALYSIS_PERIOD DATE,
    TRANSACTION_COUNT NUMBER,
    TOTAL_TRANSACTION_AMOUNT NUMBER(38,2),
    AVG_TRANSACTION_AMOUNT NUMBER(38,2),
    LAST_TRANSACTION_DATE DATE,
    ACTIVITY_STATUS TEXT
);


-- 2. Populate the target analytical dataset
INSERT INTO CUSTOMER_ACTIVITY (
    CUSTOMER_ID,
    AGE,
    CUSTOMER_TYPE,
    CITY,
    REGION,
    BRANCH_ID,
    BANK_NAME,
    ANALYSIS_PERIOD,
    TRANSACTION_COUNT,
    TOTAL_TRANSACTION_AMOUNT,
    AVG_TRANSACTION_AMOUNT,
    LAST_TRANSACTION_DATE,
    ACTIVITY_STATUS
)

WITH latest_date AS (
    SELECT
        MAX(TRANSACTION_DATE) AS max_transaction_date
    FROM TRANSACTION_DATA
),

transaction_agg AS (
    SELECT
        t.CUSTOMER_ID,
        COUNT(t.TRANSACTION_ID) AS TRANSACTION_COUNT,
        SUM(t.TRANSACTION_AMOUNT) AS TOTAL_TRANSACTION_AMOUNT,
        AVG(t.TRANSACTION_AMOUNT) AS AVG_TRANSACTION_AMOUNT,
        MAX(t.TRANSACTION_DATE) AS LAST_TRANSACTION_DATE
    FROM TRANSACTION_DATA t
    CROSS JOIN latest_date d
    WHERE t.TRANSACTION_DATE >= DATEADD(
        MONTH,
        -3,
        d.max_transaction_date
    )
    GROUP BY t.CUSTOMER_ID
)

SELECT
    c.CUSTOMER_ID,
    c.AGE,
    COALESCE(c.CUSTOMER_TYPE, 'Unknown') AS CUSTOMER_TYPE,
    c.CITY,
    c.REGION,
    c.BRANCH_ID,
    c.BANK_NAME,
    d.max_transaction_date AS ANALYSIS_PERIOD,
    COALESCE(a.TRANSACTION_COUNT, 0) AS TRANSACTION_COUNT,
    COALESCE(a.TOTAL_TRANSACTION_AMOUNT, 0) AS TOTAL_TRANSACTION_AMOUNT,
    a.AVG_TRANSACTION_AMOUNT,
    a.LAST_TRANSACTION_DATE,
    CASE
        WHEN COALESCE(a.TRANSACTION_COUNT, 0) >= 3
            THEN 'Active'
        ELSE 'Inactive'
    END AS ACTIVITY_STATUS
FROM CUSTOMER_DATA c
CROSS JOIN latest_date d
LEFT JOIN transaction_agg a
    ON c.CUSTOMER_ID = a.CUSTOMER_ID;


-- 3. Basic target validation
SELECT
    COUNT(*) AS target_rows,
    COUNT(DISTINCT CUSTOMER_ID) AS distinct_customers,
    COUNT_IF(TRANSACTION_COUNT = 0) AS customers_without_transactions,
    COUNT_IF(ACTIVITY_STATUS = 'Active') AS active_customers,
    COUNT_IF(ACTIVITY_STATUS = 'Inactive') AS inactive_customers
FROM CUSTOMER_ACTIVITY;


-- 4. Validate the rule for customers without transactions
SELECT
    COUNT(*) AS customers_without_transactions,
    COUNT_IF(TRANSACTION_COUNT = 0) AS correct_transaction_count,
    COUNT_IF(TOTAL_TRANSACTION_AMOUNT = 0) AS correct_total_amount,
    COUNT_IF(AVG_TRANSACTION_AMOUNT IS NULL) AS correct_avg_amount,
    COUNT_IF(LAST_TRANSACTION_DATE IS NULL) AS correct_last_date,
    COUNT_IF(ACTIVITY_STATUS = 'Inactive') AS correct_activity_status
FROM CUSTOMER_ACTIVITY
WHERE TRANSACTION_COUNT = 0;


-- 5. Validate Active customer classification
SELECT
    CUSTOMER_ID,
    TRANSACTION_COUNT,
    ACTIVITY_STATUS
FROM CUSTOMER_ACTIVITY
WHERE ACTIVITY_STATUS = 'Active'
  AND TRANSACTION_COUNT < 3;


-- 6. Validate the reverse Active customer classification rule
SELECT
    CUSTOMER_ID,
    TRANSACTION_COUNT,
    ACTIVITY_STATUS
FROM CUSTOMER_ACTIVITY
WHERE TRANSACTION_COUNT >= 3
  AND ACTIVITY_STATUS <> 'Active';
