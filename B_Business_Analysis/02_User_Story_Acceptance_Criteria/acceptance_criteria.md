# Acceptance Criteria

This document defines the conditions that must be met for the customer activity analysis solution to be considered acceptable.

---

<details>
<summary><strong>1. Customer Coverage</strong></summary>

| ID | Acceptance Criterion | Related Requirement |
|---|---|---|
| AC-01 | All customers are included in the output, including customers with no transactions in the selected period. | FR-08 |
| AC-02 | Customers with no transactions in the selected period have a transaction count of 0. | FR-08 |
| AC-03 | Customers with no transactions in the selected period have no last transaction date. | FR-08 |

</details>

---

<details>
<summary><strong>2. Analysis Period</strong></summary>

| ID | Acceptance Criterion | Related Requirement |
|---|---|---|
| AC-04 | The user can select or change the analysis period. | FR-01 |
| AC-05 | The default analysis period covers the last three months relative to the latest available transaction date. | FR-02 |

</details>

---

<details>
<summary><strong>3. Customer Activity Metrics</strong></summary>

| ID | Acceptance Criterion | Related Requirement |
|---|---|---|
| AC-06 | The solution provides the number of transactions for each customer in the selected period. | FR-03 |
| AC-07 | The solution provides the total transaction amount for each customer in the selected period. | FR-04 |
| AC-08 | The solution provides the average transaction amount for each customer in the selected period. | FR-05 |
| AC-09 | The solution provides the latest transaction date for each customer in the selected period. | FR-06 |

</details>

---

<details>
<summary><strong>4. Customer Activity Status</strong></summary>

| ID | Acceptance Criterion | Related Requirement |
|---|---|---|
| AC-10 | A customer is classified as active when the customer has at least 3 transactions in the selected period. | FR-07 |
| AC-11 | A customer with fewer than 3 transactions in the selected period is not classified as active. | FR-07 |
| AC-12 | A customer with no transactions in the selected period is not classified as active. | FR-07, FR-08 |

</details>

---

<details>
<summary><strong>5. Filtering and Analysis</strong></summary>

| ID | Acceptance Criterion | Related Requirement |
|---|---|---|
| AC-13 | The data supports filtering by customer type. | FR-09 |
| AC-14 | The data supports filtering by region. | FR-09 |
| AC-15 | The data supports analysis for different time periods. | FR-09 |
| AC-16 | The data supports both customer-level analysis and aggregated analysis. | FR-09 |

</details>

---

<details>
<summary><strong>6. Reporting and Data Use</strong></summary>

| ID | Acceptance Criterion | Related Requirement |
|---|---|---|
| AC-17 | The prepared dataset can be used as a source for Power BI reporting. | FR-10 |
| AC-18 | The output provides a consistent structure suitable for further analytical use. | BR-05 |

</details>

---

<details>
<summary><strong>7. Data Quality and Access</strong></summary>

| ID | Acceptance Criterion | Related Requirement |
|---|---|---|
| AC-19 | Relevant data quality checks are performed before the data is used for analysis. | NFR-01 |
| AC-20 | Source data is accessed in read-only mode. | NFR-04 |
| AC-21 | Analytical data access follows defined access rules. | NFR-02, NFR-03 |
| AC-22 | The analytical output can be traced back to the relevant source data. | NFR-06 |

</details>
