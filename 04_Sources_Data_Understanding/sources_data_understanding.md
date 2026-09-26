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
     |
     | CUSTOMER_ID
     |
     v
TRANSACTION_DATA

CUSTOMER_DATA
     |
     | BRANCH_ID
     |
     v
BANK_DATA
