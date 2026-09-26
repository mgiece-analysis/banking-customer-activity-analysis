# Requirements

## 1. Business Requirements

**BR-01 – Consistent Customer View**  
The bank needs a consistent dataset presenting customer activity.

**BR-02 – Transaction Activity Analysis**  
The solution should enable analysis of the number and value of customer transactions.

**BR-03 – Customer Analysis**  
The data should support customer analysis by `CUSTOMER_TYPE` and `REGION`.

**BR-04 – Time-Based Analysis**  
Users should be able to analyse customer activity for a selected time period.

**BR-05 – Reporting and Further Analysis**  
The prepared data should be available for reporting and further analysis.

**BR-06 – Controlled Data Access**  
Access to data should depend on the user's role and area of responsibility, including regional access where applicable.

---

## 2. Functional Requirements

**FR-01 – Analysis Period**  
The solution should allow users to select and change the analysis period.

**FR-02 – Default Analysis Period**  
By default, the analysis should cover the last three months relative to the most recent transaction date available in the dataset.

**FR-03 – Customer-Level KPIs**  
The solution should provide the following KPIs at customer level:

- `NUMBER_OF_TRANSACTIONS`
- `TOTAL_TRANSACTION_AMOUNT`
- `AVG_TRANSACTION_AMOUNT`
- `LAST_TRANSACTION_DATE`

**FR-04 – Active Customer Definition**  
The solution should identify a customer as active if the customer has made at least three transactions during the selected analysis period.

**FR-05 – Include All Customers**  
The target dataset should include all customers, including customers with no transactions during the selected analysis period.

**FR-06 – Filtering**  
Users should be able to filter the data by at least:

- `CUSTOMER_TYPE`
- `REGION`
- analysis period

**FR-07 – Aggregation**  
The solution should support analysis at customer level and aggregation by `CUSTOMER_TYPE` and `REGION`.

**FR-08 – Data Export**  
Authorized users should be able to export a selected dataset, for example to CSV or Excel.

**FR-09 – Reporting**  
The prepared dataset should be suitable for use in Power BI and other reporting solutions.

**FR-10 – Source Data Protection**  
Users should not be able to modify source data.

---

## 3. Non-Functional Requirements

**NFR-01 – Data Quality**  
The solution should support controls for data completeness, consistency and accuracy.

**NFR-02 – Security**  
Access to data should be role-based.

**NFR-03 – Regional Data Access**  
Regional users should only have access to data for their assigned region, according to their permissions.

**NFR-04 – Read-Only Access**  
Business users should have read-only access to source data.

**NFR-05 – Data Refresh**  
The solution should support data refresh in line with the source systems, with daily refresh assumed for this project.

**NFR-06 – Data Traceability**  
It should be possible to trace data from the source through transformations to the target dataset.

**NFR-07 – Maintainability**  
The solution should be structured so that the target dataset can be maintained and extended for future analytical needs.

---

## 4. Business Rules

**BRL-01 – Active Customer**  
A customer is considered active if they have made at least three transactions during the selected analysis period.

**BRL-02 – Total Transaction Amount**  
`TOTAL_TRANSACTION_AMOUNT` is the sum of all valid customer transactions within the selected analysis period.

**BRL-03 – Average Transaction Amount**  
`AVG_TRANSACTION_AMOUNT` is calculated as:

`TOTAL_TRANSACTION_AMOUNT / NUMBER_OF_TRANSACTIONS`

**BRL-04 – Last Transaction Date**  
`LAST_TRANSACTION_DATE` is the latest transaction date for the customer within the selected analysis period.

**BRL-05 – Customers Without Transactions**  
Customers without transactions during the selected period remain in the target dataset.

For such customers:

- `NUMBER_OF_TRANSACTIONS = 0`
- `TOTAL_TRANSACTION_AMOUNT = 0`
- `AVG_TRANSACTION_AMOUNT = NULL`
- `LAST_TRANSACTION_DATE = NULL`
- customer status = `Inactive`

**BRL-06 – Missing Customer Type**  
If `CUSTOMER_TYPE` is missing, it should be classified as `Unknown`.

**BRL-07 – Invalid Customer ID**  
A transaction without a valid `CUSTOMER_ID` should not be assigned to a customer and should be reported as a data quality issue.

**BRL-08 – Duplicate Transactions**  
Confirmed duplicate transactions should not inflate customer-level KPIs.

---

## 5. Data Sources

| Source | Purpose | Data Owner |
|---|---|---|
| `CUSTOMER_DATA` | Customer information | Customer Domain |
| `TRANSACTION_DATA` | Customer transaction information | Transaction / Payments Domain |
| `BANK_DATA` | Branch information | Branch Operations |

### Source Relationships

`CUSTOMER_DATA.CUSTOMER_ID` ↔ `TRANSACTION_DATA.CUSTOMER_ID`

`CUSTOMER_DATA.BRANCH_ID` ↔ `BANK_DATA.BRANCH_ID`

---

## 6. Data Sourcing and Data Understanding

The solution will use data from three source systems:

### `CUSTOMER_DATA`
Source: Customer Management System / CRM / Customer Master Data

Provides basic customer information.

### `TRANSACTION_DATA`
Source: Transaction Processing System

Provides customer transaction information.

### `BANK_DATA`
Source: Branch Management System

Provides branch information.

---

## 7. Data Refresh

- `TRANSACTION_DATA` – refreshed daily
- `CUSTOMER_DATA` – refreshed daily
- `BANK_DATA` – refreshed daily

---

## 8. Data Quality

Known or potential data quality issues include:

- missing `CUSTOMER_TYPE`
- transactions with missing or invalid `CUSTOMER_ID`
- possible duplicate transactions
- missing `TRANSACTION_AMOUNT`
- inconsistent keys or data types between source systems

The solution should identify and appropriately handle these issues.

---

## 9. Data Governance and Data Ownership

Data Owners are responsible for the business ownership of source data, including:

- business definitions
- data usage rules
- data access approval
- accountability for data quality and usage

The Data Analyst is responsible for analysis, documentation and solution preparation, but is not the Data Owner.

For the target `CUSTOMER_ACTIVITY` dataset, the assumed Data Owner is:

**Customer Analytics Data Owner / Customer Domain Owner**

---

## 10. Data Access

Access to the three source datasets should initially be **read-only**.

The access process is:

**Data Owner approval → IAM / Data Access → technical access provisioning**

The Data Analyst requests access and provides the business purpose for using the data.
