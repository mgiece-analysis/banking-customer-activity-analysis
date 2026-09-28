-- ============================================================
-- DATA MAPPING VALIDATION
-- Banking Customer Activity Analysis
-- ============================================================

-- 1. Inspect source table structures
DESCRIBE TABLE CUSTOMER_DATA;

DESCRIBE TABLE TRANSACTION_DATA;

DESCRIBE TABLE BANK_DATA;


-- 2. Check CUSTOMER_ID uniqueness in CUSTOMER_DATA
SELECT
    COUNT(*) AS customer_count,
    COUNT(DISTINCT CUSTOMER_ID) AS distinct_customer_ids
FROM CUSTOMER_DATA;


-- 3. Check TRANSACTION_ID and CUSTOMER_ID coverage in TRANSACTION_DATA
SELECT
    COUNT(*) AS transaction_count,
    COUNT(DISTINCT TRANSACTION_ID) AS distinct_transaction_ids,
    COUNT(DISTINCT CUSTOMER_ID) AS distinct_customer_ids
FROM TRANSACTION_DATA;


-- 4. Check for transactions without a matching customer
SELECT
    COUNT(*) AS transactions_without_customer
FROM TRANSACTION_DATA t
LEFT JOIN CUSTOMER_DATA c
    ON t.CUSTOMER_ID = c.CUSTOMER_ID
WHERE c.CUSTOMER_ID IS NULL;


-- 5. Check for customers without a matching branch
SELECT
    COUNT(*) AS customers_without_branch
FROM CUSTOMER_DATA c
LEFT JOIN BANK_DATA b
    ON c.BRANCH_ID = b.BRANCH_ID
WHERE b.BRANCH_ID IS NULL;


-- 6. Check BRANCH_ID uniqueness in BANK_DATA
SELECT
    COUNT(*) AS branch_count,
    COUNT(DISTINCT BRANCH_ID) AS distinct_branch_ids
FROM BANK_DATA;


-- 7. Identify duplicate BRANCH_ID values
SELECT
    BRANCH_ID,
    COUNT(*) AS occurrences
FROM BANK_DATA
GROUP BY BRANCH_ID
HAVING COUNT(*) > 1;


-- 8. Verify data types of JOIN keys
SELECT
    table_name,
    column_name,
    data_type
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_schema = 'PUBLIC'
  AND (
       (table_name = 'CUSTOMER_DATA'
        AND column_name IN ('CUSTOMER_ID', 'BRANCH_ID'))
       OR
       (table_name = 'TRANSACTION_DATA'
        AND column_name = 'CUSTOMER_ID')
       OR
       (table_name = 'BANK_DATA'
        AND column_name = 'BRANCH_ID')
  )
ORDER BY table_name, column_name;
