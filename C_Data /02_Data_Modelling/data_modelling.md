# Data Modelling

This document defines the logical data model for the Banking Customer Activity Analysis project.

The purpose of the data model is to describe the main entities, their relationships, the grain of the target dataset, and the structure required to support customer activity analysis and reporting.

---

<details>
<summary><strong>1. Data Modelling Purpose</strong></summary>

The data model provides a structured representation of the data used in the analytical solution.

It helps to:

- define the main entities and their relationships
- establish the grain of the target dataset
- identify key fields
- support consistent joins and aggregations
- provide a basis for SQL implementation
- support reporting and further analysis
- improve data traceability and maintainability

The model is based on the following source datasets:

- `CUSTOMER_DATA`
- `TRANSACTION_DATA`
- `BANK_DATA`

</details>

---

<details>
<summary><strong>2. Source Data Model</strong></summary>

The source data consists of three related datasets.

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

### Main Relationships

| Parent Dataset | Key | Child Dataset | Key |
|---|---|---|---|
| `CUSTOMER_DATA` | `CUSTOMER_ID` | `TRANSACTION_DATA` | `CUSTOMER_ID` |
| `BANK_DATA` | `BRANCH_ID` | `CUSTOMER_DATA` | `BRANCH_ID` |

These relationships are used to connect customer attributes, transaction activity, and branch information.

</details>

---

<details>
<summary><strong>3. Data Model Grain</strong></summary>

The grain of a dataset defines what a single record represents.

For the target analytical dataset, the grain is:

> **One record per customer for the selected analysis period.**

This means that each `CUSTOMER_ID` should appear once in the target customer activity dataset for a given analysis period.

Transaction-level data remains at transaction grain in the source dataset, while transaction metrics are aggregated to customer level in the target dataset.

### Grain Transformation

```text
Transaction Grain
(one record per transaction)
        ↓
Customer-level aggregation
        ↓
Customer Activity Grain
(one record per customer per analysis period)
```

Defining the grain prevents unintended duplication and ensures that customer-level metrics are calculated consistently.

</details>

---

<details>
<summary><strong>4. Main Entities</strong></summary>

The model uses the following main entities:

| Entity | Purpose | Main Key |
|---|---|---|
| Customer | Represents the bank customer | `CUSTOMER_ID` |
| Transaction | Represents a customer transaction | `TRANSACTION_ID` |
| Branch | Represents a bank branch | `BRANCH_ID` |
| Customer Activity | Represents the analytical customer-level output | `CUSTOMER_ID` + analysis period |

### Entity Relationships

```text
Customer
   │
   ├──────────────< Transaction
   │
   └────────────── Branch
```

A customer can be associated with multiple transactions.

A customer is associated with a branch through `BRANCH_ID`.

The `Customer Activity` entity is the analytical representation built from the relevant source entities.

</details>

---

<details>
<summary><strong>5. Keys</strong></summary>

Keys are used to identify records and establish relationships between datasets.

| Key | Dataset | Purpose |
|---|---|---|
| `CUSTOMER_ID` | `CUSTOMER_DATA` | Identifies a customer |
| `TRANSACTION_ID` | `TRANSACTION_DATA` | Identifies a transaction |
| `BRANCH_ID` | `BANK_DATA` | Identifies a branch |

### Relationships

```text
CUSTOMER_DATA.CUSTOMER_ID
          ↓
TRANSACTION_DATA.CUSTOMER_ID
```

```text
CUSTOMER_DATA.BRANCH_ID
          ↓
BANK_DATA.BRANCH_ID
```

The target analytical dataset uses `CUSTOMER_ID` as the primary business identifier at customer level.

Where the analysis period is stored as part of the target model, the combination of customer and analysis period represents the logical grain of the record.

</details>

---

<details>
<summary><strong>6. Target Customer Activity Model</strong></summary>

The target model is centered around the customer.

A simplified logical representation is:

```text
                   CUSTOMER
              ┌─────────────────┐
              │ CUSTOMER_ID     │
              │ AGE             │
              │ CUSTOMER_TYPE   │
              │ CITY            │
              │ REGION          │
              │ BRANCH_ID       │
              │ BANK_NAME       │
              └────────┬────────┘
                       │
                       ↓
              CUSTOMER_ACTIVITY
              ┌──────────────────────────────┐
              │ CUSTOMER_ID                  │
              │ ANALYSIS_PERIOD              │
              │ TRANSACTION_COUNT            │
              │ TOTAL_TRANSACTION_AMOUNT     │
              │ AVG_TRANSACTION_AMOUNT       │
              │ LAST_TRANSACTION_DATE        │
              │ ACTIVITY_STATUS              │
              └──────────────────────────────┘
                       ↑
                       │
                TRANSACTION
              ┌─────────────────┐
              │ TRANSACTION_ID  │
              │ CUSTOMER_ID     │
              │ TRANSACTION_    │
              │ AMOUNT          │
              │ TRANSACTION_DATE│
              └─────────────────┘
```

Branch information can provide additional contextual attributes through the customer-to-branch relationship.

</details>

---

<details>
<summary><strong>7. Target Dataset Structure</strong></summary>

The target customer activity dataset is designed to contain customer attributes and calculated activity metrics.

| Field | Type of Information | Source / Logic |
|---|---|---|
| `CUSTOMER_ID` | Customer identifier | `CUSTOMER_DATA.CUSTOMER_ID` |
| `AGE` | Customer attribute | `CUSTOMER_DATA.AGE` |
| `CUSTOMER_TYPE` | Customer classification | `CUSTOMER_DATA.CUSTOMER_TYPE` |
| `CITY` | Customer location | `CUSTOMER_DATA.CITY` |
| `REGION` | Customer region | `CUSTOMER_DATA.REGION` |
| `BRANCH_ID` | Branch identifier | `CUSTOMER_DATA.BRANCH_ID` |
| `BANK_NAME` | Bank information | `CUSTOMER_DATA.BANK_NAME` |
| `ANALYSIS_PERIOD` | Selected reporting period | Analytical logic |
| `TRANSACTION_COUNT` | Transaction metric | Count of valid transactions |
| `TOTAL_TRANSACTION_AMOUNT` | Transaction metric | Sum of valid transaction amounts |
| `AVG_TRANSACTION_AMOUNT` | Transaction metric | Average valid transaction amount |
| `LAST_TRANSACTION_DATE` | Transaction metric | Latest valid transaction date |
| `ACTIVITY_STATUS` | Derived classification | Business rule |

The target structure may be adjusted during implementation if technical validation identifies a necessary change.

</details>

---

<details>
<summary><strong>8. Relationship Cardinality</strong></summary>

The main source relationships can be described using the following cardinalities:

### Customer → Transaction

```text
One Customer
     │
     └──────< Many Transactions
```

A customer may have zero, one, or many transactions.

This is important because the analytical solution must also preserve customers with no transactions during the selected period.

### Branch → Customer

```text
One Branch
     │
     └──────< Many Customers
```

A branch may be associated with multiple customers.

The actual validity of these relationships should be confirmed through data quality and referential integrity checks.

</details>

---

<details>
<summary><strong>9. Transformation from Source Model to Target Model</strong></summary>

The source datasets are transformed into a customer-level analytical structure.

```text
CUSTOMER_DATA
      +
TRANSACTION_DATA
      +
BANK_DATA
      ↓
Join using defined keys
      ↓
Apply analysis period
      ↓
Aggregate transactions by customer
      ↓
Apply business rules
      ↓
Create CUSTOMER_ACTIVITY
```

The customer dataset provides the base population.

Transaction data provides customer activity metrics.

Branch data provides additional contextual information where required.

</details>

---

<details>
<summary><strong>10. Handling Customers Without Transactions</strong></summary>

The target model must preserve customers who do not have transactions during the selected analysis period.

The customer population therefore acts as the driving dataset for the customer-level output.

Conceptually:

```text
All Customers
      ↓
LEFT JOIN Transactions
      ↓
Customer Activity Metrics
```

This approach ensures that customers without transactions are not removed from the target dataset.

For such customers:

- `TRANSACTION_COUNT = 0`
- `TOTAL_TRANSACTION_AMOUNT = 0`
- `AVG_TRANSACTION_AMOUNT = NULL`
- `LAST_TRANSACTION_DATE = NULL`
- `ACTIVITY_STATUS = Inactive`

These values follow the defined Business Rules.

</details>

---

<details>
<summary><strong>11. Modelling Considerations</strong></summary>

The following modelling considerations apply to the target solution:

- the customer is the main analytical entity
- the target dataset uses customer-level grain
- transaction-level data is aggregated before customer-level metrics are created
- source keys are used to establish relationships
- customers without transactions must be retained
- business rules must be applied consistently
- the target structure should support Power BI reporting
- the model should remain understandable and maintainable

The model should avoid unnecessary duplication of customer-level attributes.

</details>

---

<details>
<summary><strong>12. Validation of the Data Model</strong></summary>

The data model should be validated before implementation is considered complete.

Validation includes:

- confirming the intended grain of the target dataset
- confirming key relationships
- checking that customer records are not unintentionally duplicated
- validating customer-to-transaction relationships
- validating customer-to-branch relationships
- confirming that customers without transactions are preserved
- confirming that aggregated metrics are calculated at the correct level
- checking that the target structure supports the defined requirements

Model validation will be supported by SQL checks during the Snowflake implementation stage.

</details>

---

<details>
<summary><strong>13. Logical Model Summary</strong></summary>

The logical data model can be summarized as:

```text
CUSTOMER_DATA
      │
      ├──────────────< TRANSACTION_DATA
      │
      └────────────── BANK_DATA
                         │
                         ↓
               Customer Activity Model
                         │
                         ↓
                 CUSTOMER_ACTIVITY
                         │
                         ↓
                    Power BI
```

The model provides a customer-centric analytical structure while maintaining relationships with transaction and branch data.

The next stage is to translate this logical model into a technical implementation using SQL in Snowflake.

</details>

---

## Related Documentation

- [Requirements](../../B_Business_Analysis/01_Requirements/requirements.md)
- [Business Rules](../../B_Business_Analysis/03_Business_Rules/business_rules.md)
- [Data Sourcing & Data Understanding](../../B_Business_Analysis/04_Sources_Data_Understanding/sources_data_understanding.md)
- [Data Quality](../../B_Business_Analysis/05_Data_Quality/data_quality.md)
- [Data Mapping](../01_Data_Mapping/data_mapping.md)
- [Data Flow / Data Lineage](../03_Data_Flow_Data_Lineage/data_flow_data_lineage.md)
- [Solution Design](../../B_Business_Analysis/10_Solution_Design/solution_design.md)
- [Target Solution](../../B_Business_Analysis/11_Target_Solution/target_solution.md)
