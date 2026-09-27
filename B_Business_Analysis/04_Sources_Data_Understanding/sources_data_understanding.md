# Data Sourcing & Data Understanding

This document describes the data sources used in the Banking Customer Activity Analysis project and provides an initial understanding of their structure, content, relationships, and business context.

---

<details>
<summary><strong>1. Data Sources Overview</strong></summary>

The analysis uses three primary data sources:

| Source | Purpose | Key Information |
|---|---|---|
| `CUSTOMER_DATA` | Customer information | Customer identifiers, customer type, location, region, bank and branch information |
| `TRANSACTION_DATA` | Transaction activity | Transactions, amounts, dates, account and investment information |
| `BANK_DATA` | Branch information | Branch location, region, expenses, revenue and profit margin |

The sources are used together to create a consistent customer activity view for analytical and reporting purposes.

</details>

---

<details>
<summary><strong>2. CUSTOMER_DATA</strong></summary>

### Purpose

`CUSTOMER_DATA` contains information about bank customers and their basic characteristics.

### Key Attributes

| Column | Description |
|---|---|
| `CUSTOMER_ID` | Unique identifier of the customer |
| `AGE` | Customer age |
| `CUSTOMER_TYPE` | Customer classification / segment |
| `CITY` | Customer city |
| `REGION` | Customer region |
| `BANK_NAME` | Bank name |
| `BRANCH_ID` | Identifier of the associated branch |

### Observed Data Characteristics

- Approximately 10,000 customer records
- `CUSTOMER_ID` is used to identify customers
- Some records contain missing values in `AGE`, `CUSTOMER_TYPE`, and `CITY`
- `BRANCH_ID` can be used to connect customer data with branch information

</details>

---

<details>
<summary><strong>3. TRANSACTION_DATA</strong></summary>

### Purpose

`TRANSACTION_DATA` contains customer transaction and financial activity used for customer activity analysis.

### Key Attributes

| Column | Description |
|---|---|
| `TRANSACTION_ID` | Unique identifier of the transaction |
| `CUSTOMER_ID` | Identifier linking a transaction to a customer |
| `TRANSACTION_AMOUNT` | Transaction amount |
| `TRANSACTION_DATE` | Date of the transaction |
| `ACCOUNT_TYPE` | Type of account associated with the transaction |
| `INVESTMENT_AMOUNT` | Investment amount |
| `INVESTMENT_TYPE` | Investment type |
| `TOTAL_BALANCE` | Total account balance |

### Observed Data Characteristics

- Approximately 10,000 transaction records
- `CUSTOMER_ID` is used to associate transactions with customers
- `TRANSACTION_DATE` supports time-based analysis
- `TRANSACTION_AMOUNT` is used for transaction value calculations
- The dataset does not contain missing values in the main transaction fields reviewed

</details>

---

<details>
<summary><strong>4. BANK_DATA</strong></summary>

### Purpose

`BANK_DATA` contains information about bank branches and their geographical and financial characteristics.

### Key Attributes

| Column | Description |
|---|---|
| `BRANCH_ID` | Unique identifier of the branch |
| `CITY` | Branch city |
| `REGION` | Branch region |
| `EXPENSES` | Branch expenses |
| `FIRM_REVENUE` | Firm revenue associated with the branch |
| `PROFIT_MARGIN` | Profit margin |

### Observed Data Characteristics

- Approximately 1,000 branch records
- `BRANCH_ID` is used to associate branches with customers
- Some records contain missing values in `FIRM_REVENUE`

</details>

---

<details>
<summary><strong>5. Data Relationships</strong></summary>

The main relationships between the three datasets are:

```text
CUSTOMER_DATA
      │
      │ CUSTOMER_ID
      ↓
TRANSACTION_DATA

CUSTOMER_DATA
      │
      │ BRANCH_ID
      ↓
BANK_DATA
```

### Relationship Description

- `CUSTOMER_DATA.CUSTOMER_ID` → `TRANSACTION_DATA.CUSTOMER_ID`
- `CUSTOMER_DATA.BRANCH_ID` → `BANK_DATA.BRANCH_ID`

These relationships allow customer information to be combined with transaction activity and branch-related information.

</details>

---

<details>
<summary><strong>6. Source-to-Analysis Usage</strong></summary>

| Analytical Requirement | Primary Source |
|---|---|
| Customer population | `CUSTOMER_DATA` |
| Customer type analysis | `CUSTOMER_DATA` |
| Regional customer analysis | `CUSTOMER_DATA` |
| Transaction count | `TRANSACTION_DATA` |
| Transaction value | `TRANSACTION_DATA` |
| Time-based transaction analysis | `TRANSACTION_DATA` |
| Branch information | `BANK_DATA` |
| Branch region analysis | `BANK_DATA` |
| Customer-to-branch relationship | `CUSTOMER_DATA` + `BANK_DATA` |

The sources are combined only when required by the analytical use case.

</details>

---

<details>
<summary><strong>7. Data Refresh</strong></summary>

For the purpose of this project, a daily refresh cycle is assumed for the analytical data sources.

The refresh assumption is documented as part of the project requirements and can be adjusted in a production environment according to business needs and source-system capabilities.

</details>

---

<details>
<summary><strong>8. Initial Data Understanding Findings</strong></summary>

The initial review identified several points relevant for further analysis:

- Missing values exist in selected customer attributes.
- Missing `FIRM_REVENUE` values exist in `BANK_DATA`.
- Customer and transaction data can be linked using `CUSTOMER_ID`.
- Customer and branch data can be linked using `BRANCH_ID`.
- Transaction dates support configurable time-based analysis.
- Customer-level analysis requires preserving customers with no transactions in the selected period.

These findings will be further addressed in the Data Quality, Data Mapping, and Data Modelling documentation.

</details>

---

<details>
<summary><strong>9. Data Ownership</strong></summary>

For the purpose of the project, the following data ownership model is assumed:

| Data Source | Business Owner |
|---|---|
| `CUSTOMER_DATA` | Customer Domain |
| `TRANSACTION_DATA` | Transaction / Payments Domain |
| `BANK_DATA` | Branch Operations |

Data Owners are responsible for business definitions, data ownership, and access approval. Technical access is provisioned through the appropriate access management process.

Detailed governance and ownership responsibilities are documented separately.

</details>

---

## Related Documentation

- [Requirements](../01_Requirements/requirements.md)
- [Business Rules](../03_Business_Rules/business_rules.md)
- [Data Quality](../05_Data_Quality/data_quality.md)
- [Data Governance & Data Ownership](../06_Data_Governance_Ownership/data_governance_ownership.md)
- [Data Mapping](../C_Data/01_Data_Mapping/data_mapping.md)
- [Data Modelling](../C_Data/02_Data_Modelling/data_modelling.md)
