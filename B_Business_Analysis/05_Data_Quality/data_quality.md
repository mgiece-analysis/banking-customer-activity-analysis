# Data Quality

This document defines the data quality checks performed as part of the Banking Customer Activity Analysis project. The purpose is to identify data issues that may affect analysis, reporting, or the reliability of the target analytical dataset.

---

<details>
<summary><strong>1. Data Quality Objectives</strong></summary>

The main objectives of the data quality assessment are to:

- identify missing or invalid values
- verify key fields used to join datasets
- identify potential duplicate records
- verify data consistency across related datasets
- ensure that analytical metrics are based on reliable data
- document identified data quality issues and their potential impact

</details>

---

<details>
<summary><strong>2. Data Quality Dimensions</strong></summary>

The project focuses on the following data quality dimensions:

| Dimension | Description |
|---|---|
| Completeness | Required values are present and missing values are identified |
| Validity | Values conform to expected formats and business definitions |
| Consistency | Related fields and datasets contain compatible information |
| Uniqueness | Records that should be unique are not duplicated |
| Accuracy | Values used for analysis are logically and technically correct |
| Timeliness | Data is refreshed according to the defined refresh cycle |

</details>

---

<details>
<summary><strong>3. CUSTOMER_DATA Quality Checks</strong></summary>

The following checks are applied to `CUSTOMER_DATA`:

| Check | Purpose | Observed Result |
|---|---|---|
| Customer ID completeness | Verify that customer identifiers are present | No missing values observed |
| Customer ID uniqueness | Identify potential duplicate customer records | To be validated |
| Customer Type completeness | Identify missing customer classifications | Missing values observed |
| Age completeness | Identify missing customer age values | Missing values observed |
| City completeness | Identify missing customer city values | Missing values observed |
| Branch ID validity | Verify that branch identifiers can be linked to branch data | To be validated |

Approximately 10,000 customer records were reviewed.

Missing values were observed in selected customer attributes, including:

- `CUSTOMER_TYPE`
- `AGE`
- `CITY`

Missing customer attributes should not automatically exclude customers from the analytical dataset.

</details>

---

<details>
<summary><strong>4. TRANSACTION_DATA Quality Checks</strong></summary>

The following checks are applied to `TRANSACTION_DATA`:

| Check | Purpose | Observed Result |
|---|---|---|
| Transaction ID completeness | Verify that transaction identifiers are present | No missing values observed |
| Transaction ID uniqueness | Identify potential duplicate transactions | To be validated |
| Customer ID completeness | Verify customer assignment | No missing values observed in the reviewed data |
| Transaction amount completeness | Verify that transaction values are available | No missing values observed |
| Transaction date completeness | Verify that transactions have a valid date | No missing values observed |
| Customer ID referential integrity | Verify that transaction customers exist in `CUSTOMER_DATA` | To be validated |

Approximately 10,000 transaction records were reviewed.

No missing values were observed in the main transaction fields reviewed.

Potential duplicate transactions and referential integrity should be checked before final analytical calculations.

</details>

---

<details>
<summary><strong>5. BANK_DATA Quality Checks</strong></summary>

The following checks are applied to `BANK_DATA`:

| Check | Purpose | Observed Result |
|---|---|---|
| Branch ID completeness | Verify branch identifiers | No missing values observed |
| Branch ID uniqueness | Identify duplicate branch records | To be validated |
| City completeness | Identify missing branch locations | To be validated |
| Region completeness | Identify missing regional information | To be validated |
| Firm Revenue completeness | Identify missing revenue values | Missing values observed |
| Customer branch reference | Verify branch identifiers used by customers | To be validated |

Approximately 1,000 branch records were reviewed.

Missing values were observed in `FIRM_REVENUE`.

</details>

---

<details>
<summary><strong>6. Referential Integrity</strong></summary>

Relationships between the source datasets should be validated before creating the target analytical dataset.

### Customer → Transaction

`TRANSACTION_DATA.CUSTOMER_ID` should reference a valid:

`CUSTOMER_DATA.CUSTOMER_ID`

Transactions with missing or invalid customer identifiers should be treated as data quality issues and should not be incorrectly assigned to another customer.

### Customer → Branch

`CUSTOMER_DATA.BRANCH_ID` should reference a valid:

`BANK_DATA.BRANCH_ID`

Invalid branch references may result in incomplete branch or regional analysis.

</details>

---

<details>
<summary><strong>7. Duplicate Detection</strong></summary>

Duplicate records may affect transaction counts and financial metrics.

The following checks should be performed:

- identify duplicated `CUSTOMER_ID` records where uniqueness is expected
- identify duplicated `BRANCH_ID` records where uniqueness is expected
- identify duplicated `TRANSACTION_ID` values
- investigate potential duplicate transactions before removing or excluding them

Confirmed duplicates should not inflate analytical metrics.

Potential duplicates should be investigated before being treated as errors.

</details>

---

<details>
<summary><strong>8. Data Quality Rules for Analytical Output</strong></summary>

The following rules are applied when preparing the analytical dataset:

| Rule | Expected Handling |
|---|---|
| Missing customer type | Represent as `Unknown` |
| Customer with no transactions | Keep the customer in the output |
| Customer with no transactions | Transaction count = 0 |
| Customer with no transactions | Total transaction amount = 0 |
| Customer with no transactions | Average transaction amount = NULL |
| Customer with no transactions | Last transaction date = NULL |
| Missing or invalid transaction customer ID | Treat as a data quality issue |
| Confirmed duplicate transaction | Exclude from analytical calculations |
| Missing source attribute | Investigate and document impact |

These rules ensure that data quality issues are handled consistently and transparently.

</details>

---

<details>
<summary><strong>9. Data Quality Assessment Summary</strong></summary>

The initial assessment identified the following areas requiring attention:

- missing values in selected customer attributes
- missing `FIRM_REVENUE` values in `BANK_DATA`
- potential duplicate records
- referential integrity between related datasets
- validation of key uniqueness

The identified issues should be considered when preparing the target analytical dataset and interpreting analytical results.

Not every missing value represents an error. The business meaning and analytical impact of each issue should be considered before applying corrective actions.

</details>

---

<details>
<summary><strong>10. Data Quality and Business Impact</strong></summary>

Data quality issues can affect analytical results in different ways.

For example:

- missing customer classifications may affect customer segmentation
- invalid customer identifiers may prevent transactions from being assigned correctly
- duplicate transactions may inflate transaction counts and transaction values
- missing branch relationships may affect regional analysis
- missing financial values may affect branch-level financial analysis

Therefore, data quality validation is performed before the data is used for reporting and further analysis.

</details>

---

## Related Documentation

- [Requirements](../01_Requirements/requirements.md)
- [Business Rules](../03_Business_Rules/business_rules.md)
- [Data Sourcing & Data Understanding](../04_Sources_Data_Understanding/sources_data_understanding.md)
- [Data Governance & Data Ownership](../06_Data_Governance_Ownership/data_governance_ownership.md)
- [Data Mapping](../C_Data/01_Data_Mapping/data_mapping.md)
- [Data Modelling](../C_Data/02_Data_Modelling/data_modelling.md)
