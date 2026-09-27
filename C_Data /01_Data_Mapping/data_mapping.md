# Data Mapping

This document defines the mapping between source data attributes and the target customer activity dataset.

The purpose of data mapping is to document where each target attribute comes from, how it is transformed, and which business rules or conditions apply.

---

<details>
<summary><strong>1. Data Mapping Purpose</strong></summary>

Data mapping establishes a clear relationship between source attributes and the target analytical dataset.

It helps to:

- understand where target data comes from
- document source-to-target relationships
- identify required transformations
- support data lineage and traceability
- ensure consistent implementation
- support validation of the target dataset

The mapping is based on the three source datasets used in the project:

- `CUSTOMER_DATA`
- `TRANSACTION_DATA`
- `BANK_DATA`

</details>

---

<details>
<summary><strong>2. Source-to-Target Mapping Overview</strong></summary>

The target analytical dataset is built at customer level.

The main source-to-target relationships are:

```text
CUSTOMER_DATA
      ↓
Customer Attributes
      ↓
CUSTOMER_ACTIVITY

TRANSACTION_DATA
      ↓
Transaction Metrics
      ↓
CUSTOMER_ACTIVITY

BANK_DATA
      ↓
Branch / Regional Information
      ↓
CUSTOMER_ACTIVITY
```

The target dataset combines customer attributes, transaction activity metrics, and relevant branch or regional information.

</details>

---

<details>
<summary><strong>3. Customer Attribute Mapping</strong></summary>

| Target Attribute | Source Table | Source Attribute | Transformation / Logic |
|---|---|---|---|
| `CUSTOMER_ID` | `CUSTOMER_DATA` | `CUSTOMER_ID` | Direct mapping |
| `AGE` | `CUSTOMER_DATA` | `AGE` | Direct mapping |
| `CUSTOMER_TYPE` | `CUSTOMER_DATA` | `CUSTOMER_TYPE` | Missing values represented as `Unknown` |
| `CITY` | `CUSTOMER_DATA` | `CITY` | Direct mapping |
| `REGION` | `CUSTOMER_DATA` | `REGION` | Direct mapping |
| `BRANCH_ID` | `CUSTOMER_DATA` | `BRANCH_ID` | Direct mapping |
| `BANK_NAME` | `CUSTOMER_DATA` | `BANK_NAME` | Direct mapping |

`CUSTOMER_DATA` provides the base customer population for the target dataset.

All customers should be retained, including customers without transactions during the selected analysis period.

</details>

---

<details>
<summary><strong>4. Transaction Metric Mapping</strong></summary>

| Target Attribute | Source Table | Source Attribute | Transformation / Logic |
|---|---|---|---|
| `TRANSACTION_COUNT` | `TRANSACTION_DATA` | `TRANSACTION_ID` | Count valid transactions per customer within the selected period |
| `TOTAL_TRANSACTION_AMOUNT` | `TRANSACTION_DATA` | `TRANSACTION_AMOUNT` | Sum valid transaction amounts per customer within the selected period |
| `AVG_TRANSACTION_AMOUNT` | `TRANSACTION_DATA` | `TRANSACTION_AMOUNT` | Total transaction amount divided by transaction count |
| `LAST_TRANSACTION_DATE` | `TRANSACTION_DATA` | `TRANSACTION_DATE` | Maximum valid transaction date per customer within the selected period |
| `ACTIVITY_STATUS` | `TRANSACTION_DATA` | `TRANSACTION_ID` | Active when the customer has at least 3 valid transactions; otherwise Inactive |

Transaction data is associated with customers through `CUSTOMER_ID`.

All transaction-based metrics must use the same selected analysis period.

</details>

---

<details>
<summary><strong>5. Branch and Regional Mapping</strong></summary>

| Target Attribute | Source Table | Source Attribute | Transformation / Logic |
|---|---|---|---|
| `BRANCH_ID` | `CUSTOMER_DATA` | `BRANCH_ID` | Direct mapping |
| `CITY` | `BANK_DATA` | `CITY` | Retrieved through `BRANCH_ID` relationship where required |
| `REGION` | `BANK_DATA` | `REGION` | Retrieved through `BRANCH_ID` relationship where required |

The customer-to-branch relationship is established using:

`CUSTOMER_DATA.BRANCH_ID → BANK_DATA.BRANCH_ID`

The exact target usage of branch-level attributes depends on the analytical requirement.

</details>

---

<details>
<summary><strong>6. Source-to-Target Relationship Logic</strong></summary>

The main relationships used by the mapping are:

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

The customer dataset acts as the base population.

Transaction data is aggregated to customer level, while branch data can provide additional branch and regional context.

</details>

---

<details>
<summary><strong>7. Transformation Rules</strong></summary>

The following transformations are required when creating the target dataset:

| Transformation | Description |
|---|---|
| Analysis Period | Include transactions from the selected analysis period |
| Transaction Count | Count valid transactions per customer |
| Total Transaction Amount | Sum valid transaction amounts per customer |
| Average Transaction Amount | Calculate average transaction amount per customer |
| Last Transaction Date | Select the latest valid transaction date |
| Activity Status | Apply the active customer business rule |
| Missing Customer Type | Replace missing value with `Unknown` |
| No Transactions | Preserve customer and assign defined zero / NULL values |
| Duplicate Transactions | Confirmed duplicates must not inflate metrics |

The detailed business logic is defined in the Business Rules document.

</details>

---

<details>
<summary><strong>8. Source-to-Target Mapping Matrix</strong></summary>

The following matrix provides a consolidated view of the main target attributes:

| Target Field | Source | Source Field | Mapping Type |
|---|---|---|---|
| `CUSTOMER_ID` | `CUSTOMER_DATA` | `CUSTOMER_ID` | Direct |
| `AGE` | `CUSTOMER_DATA` | `AGE` | Direct |
| `CUSTOMER_TYPE` | `CUSTOMER_DATA` | `CUSTOMER_TYPE` | Direct + missing value handling |
| `CITY` | `CUSTOMER_DATA` | `CITY` | Direct |
| `REGION` | `CUSTOMER_DATA` | `REGION` | Direct |
| `BRANCH_ID` | `CUSTOMER_DATA` | `BRANCH_ID` | Direct |
| `BANK_NAME` | `CUSTOMER_DATA` | `BANK_NAME` | Direct |
| `TRANSACTION_COUNT` | `TRANSACTION_DATA` | `TRANSACTION_ID` | Aggregation |
| `TOTAL_TRANSACTION_AMOUNT` | `TRANSACTION_DATA` | `TRANSACTION_AMOUNT` | Aggregation |
| `AVG_TRANSACTION_AMOUNT` | `TRANSACTION_DATA` | `TRANSACTION_AMOUNT` | Calculation |
| `LAST_TRANSACTION_DATE` | `TRANSACTION_DATA` | `TRANSACTION_DATE` | Aggregation |
| `ACTIVITY_STATUS` | `TRANSACTION_DATA` | `TRANSACTION_ID` | Business rule |
| Branch City (where required) | `BANK_DATA` | `CITY` | Join |
| Branch Region (where required) | `BANK_DATA` | `REGION` | Join |

</details>

---

<details>
<summary><strong>9. Mapping and Data Quality Considerations</strong></summary>

Data mapping must consider identified data quality issues.

Examples include:

- missing `CUSTOMER_TYPE`
- missing `AGE`
- missing `CITY`
- missing `FIRM_REVENUE`
- potentially invalid customer identifiers
- potentially invalid branch identifiers
- possible duplicate transactions

A source field should not be mapped without considering whether its quality is sufficient for the intended analytical use.

Where a data quality issue affects the target attribute, the handling method should be documented.

</details>

---

<details>
<summary><strong>10. Mapping Validation</strong></summary>

The mapping should be validated before implementation.

Validation activities include:

- confirming that each required target field has a defined source
- confirming source-to-target relationships
- checking that transformation logic matches business rules
- verifying that customer-level aggregation is appropriate
- confirming that customers without transactions remain in the target dataset
- confirming that target fields are suitable for reporting

The mapping will be used as a reference during the SQL / Snowflake implementation.

</details>

---

<details>
<summary><strong>11. Mapping Example</strong></summary>

A simplified example of the transformation from source data to a target metric:

```text
TRANSACTION_DATA.TRANSACTION_AMOUNT
                    ↓
          filter by analysis period
                    ↓
           group by CUSTOMER_ID
                    ↓
                   SUM
                    ↓
CUSTOMER_ACTIVITY.TOTAL_TRANSACTION_AMOUNT
```

Another example:

```text
TRANSACTION_DATA.TRANSACTION_ID
                    ↓
          filter by analysis period
                    ↓
           group by CUSTOMER_ID
                    ↓
                  COUNT
                    ↓
CUSTOMER_ACTIVITY.TRANSACTION_COUNT
```

These mappings will later be implemented and validated using SQL in Snowflake.

</details>

---

## Related Documentation

- [Requirements](../../B_Business_Analysis/01_Requirements/requirements.md)
- [Business Rules](../../B_Business_Analysis/03_Business_Rules/business_rules.md)
- [Data Sourcing & Data Understanding](../../B_Business_Analysis/04_Sources_Data_Understanding/sources_data_understanding.md)
- [Data Quality](../../B_Business_Analysis/05_Data_Quality/data_quality.md)
- [Solution Design](../../B_Business_Analysis/10_Solution_Design/solution_design.md)
- [Target Solution](../../B_Business_Analysis/11_Target_Solution/target_solution.md)
- [Data Modelling](../02_Data_Modelling/data_modelling.md)
- [Data Flow / Data Lineage](../03_Data_Flow_Data_Lineage/data_flow_data_lineage.md)
