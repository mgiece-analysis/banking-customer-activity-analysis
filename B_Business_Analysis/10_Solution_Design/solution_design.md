# Solution Design

This document describes the proposed analytical solution for the Banking Customer Activity Analysis project. It translates the identified business requirements, data needs, business rules, and process requirements into a structured solution design.

The solution is designed to provide a consistent customer activity dataset for analysis and reporting while preserving traceability, data quality, and controlled access.

---

<details>
<summary><strong>1. Solution Overview</strong></summary>

The proposed solution combines customer, transaction, and branch data into a structured analytical dataset.

The solution uses:

- Snowflake as the analytical data platform
- SQL for data preparation and transformation
- defined business rules for customer activity calculations
- documented data quality checks
- Power BI for reporting and visualization
- documented data mapping and lineage for traceability

The solution is designed as an analytical layer and does not modify the source systems.

</details>

---

<details>
<summary><strong>2. High-Level Solution Flow</strong></summary>

```text
CUSTOMER_DATA
      +
TRANSACTION_DATA
      +
BANK_DATA
      ↓
Source Data Validation
      ↓
Data Mapping & Transformation
      ↓
Business Rules
      ↓
Customer Activity Dataset
      ↓
Validation
      ↓
Power BI Reporting
```

The solution separates source data from the analytical output and applies defined rules before the data is exposed for reporting.

</details>

---

<details>
<summary><strong>3. Source Data Layer</strong></summary>

The source layer contains the datasets required for the analysis:

| Source | Main Purpose |
|---|---|
| `CUSTOMER_DATA` | Customer attributes and customer-to-branch relationship |
| `TRANSACTION_DATA` | Customer transaction activity |
| `BANK_DATA` | Branch and regional information |

Source data is accessed in read-only mode.

The source structures and relationships are documented separately in the Data Sourcing & Data Understanding and Data Mapping artefacts.

</details>

---

<details>
<summary><strong>4. Analytical Transformation Layer</strong></summary>

The analytical layer prepares the data for customer activity analysis.

The main transformation activities include:

- joining customer and transaction data using `CUSTOMER_ID`
- joining customer and branch data using `BRANCH_ID`
- applying the selected analysis period
- calculating transaction count
- calculating total transaction amount
- calculating average transaction amount
- identifying the latest transaction date
- determining customer activity status
- handling missing customer type values
- handling customers without transactions
- applying duplicate transaction rules

The transformations are implemented using SQL in Snowflake.

</details>

---

<details>
<summary><strong>5. Target Analytical Dataset</strong></summary>

The target dataset is designed around the customer as the main analytical entity.

A simplified target structure is:

| Attribute | Description |
|---|---|
| `CUSTOMER_ID` | Customer identifier |
| `AGE` | Customer age |
| `CUSTOMER_TYPE` | Customer classification |
| `CITY` | Customer city |
| `REGION` | Customer region |
| `BRANCH_ID` | Associated branch |
| `BANK_NAME` | Bank name |
| `TRANSACTION_COUNT` | Number of valid transactions in the selected period |
| `TOTAL_TRANSACTION_AMOUNT` | Total transaction amount in the selected period |
| `AVG_TRANSACTION_AMOUNT` | Average transaction amount in the selected period |
| `LAST_TRANSACTION_DATE` | Latest transaction date in the selected period |
| `ACTIVITY_STATUS` | Active / Inactive status |

The target dataset should contain one customer-level record for the selected analysis period.

Customers without transactions remain in the dataset according to the defined business rules.

</details>

---

<details>
<summary><strong>6. Business Rule Application</strong></summary>

The solution applies the documented Business Rules to ensure consistent analytical results.

Examples include:

- the default analysis period covers the last three months relative to the latest available transaction date
- all customers are retained in the target dataset
- customers with no transactions have transaction count = 0
- customers with no transactions have total transaction amount = 0
- average transaction amount is NULL when no transactions exist
- last transaction date is NULL when no transactions exist
- a customer is Active when they have at least 3 valid transactions
- missing customer type is represented as `Unknown`
- confirmed duplicate transactions must not inflate analytical metrics

The Business Rules artefact is the reference for detailed business logic.

</details>

---

<details>
<summary><strong>7. Data Quality Controls</strong></summary>

Data quality controls are applied before the final analytical output is used for reporting.

The solution includes checks for:

- completeness
- validity
- uniqueness
- consistency
- referential integrity
- missing values
- duplicate records

Examples of validation include:

```text
Check CUSTOMER_ID
        ↓
Check TRANSACTION_ID
        ↓
Check BRANCH_ID
        ↓
Check Missing Values
        ↓
Check Duplicates
        ↓
Check Referential Integrity
        ↓
Validate Analytical Metrics
```

Data quality findings are documented separately and should be addressed according to their business impact.

</details>

---

<details>
<summary><strong>8. Access and Security Considerations</strong></summary>

The solution follows the access principles defined in the Data Governance & Data Ownership documentation.

Key considerations include:

- read-only access to source data
- access based on user role and business need
- regional access restrictions where applicable
- controlled access to analytical outputs
- avoiding unnecessary exposure of sensitive customer information

The solution does not require modification of source systems.

</details>

---

<details>
<summary><strong>9. Reporting Layer</strong></summary>

The target analytical dataset is designed to support Power BI reporting.

Potential reporting views include:

- overall customer activity
- active vs inactive customers
- transaction volume
- transaction value
- customer type analysis
- regional analysis
- time-based analysis

Power BI consumes the prepared analytical data rather than applying the core business logic independently.

This supports consistency between SQL-based analysis and reporting.

</details>

---

<details>
<summary><strong>10. Traceability and Lineage</strong></summary>

The solution should provide traceability from the final analytical metrics back to the relevant source data.

For example:

```text
TRANSACTION_DATA.TRANSACTION_AMOUNT
                  ↓
      Transaction-level validation
                  ↓
       Customer-level aggregation
                  ↓
 TOTAL_TRANSACTION_AMOUNT
                  ↓
          Power BI Report
```

Data Mapping and Data Flow / Data Lineage documentation provide the detailed source-to-target relationships and transformation flow.

</details>

---

<details>
<summary><strong>11. Maintainability Considerations</strong></summary>

The solution should be structured so that business logic and transformations are understandable and maintainable.

The following principles are applied:

- business rules are documented separately
- source-to-target mappings are documented
- transformations are implemented using clear SQL logic
- data quality checks are documented
- assumptions are recorded
- analytical output has a defined structure
- dependencies between project artefacts are documented

This makes future changes to the analysis period, business rules, or reporting requirements easier to manage.

</details>

---

<details>
<summary><strong>12. Solution Assumptions</strong></summary>

The solution design is based on the following assumptions:

- source datasets are available in Snowflake
- source data is accessed in read-only mode
- the three source datasets are refreshed daily
- `CUSTOMER_ID` is the customer-level identifier
- `BRANCH_ID` is used to connect customers with branch data
- the selected analysis period can change
- the default analysis period is the last three months
- Power BI is used as the reporting tool
- production implementation is outside the scope of this portfolio project

These assumptions should be validated with relevant stakeholders in a real production environment.

</details>

---

<details>
<summary><strong>13. Solution Design Summary</strong></summary>

The proposed solution creates a structured analytical layer between the source systems and reporting.

The main design principle is:

```text
Source Data
    ↓
Validation
    ↓
Transformation
    ↓
Business Rules
    ↓
Target Analytical Dataset
    ↓
Validation
    ↓
Reporting
```

This approach provides a consistent basis for customer activity analysis while supporting data quality, traceability, controlled access, and maintainability.

</details>

---

## Related Documentation

- [Requirements](../01_Requirements/requirements.md)
- [User Story & Acceptance Criteria](../02_User_Story_Acceptance_Criteria/user_story.md)
- [Business Rules](../03_Business_Rules/business_rules.md)
- [Data Sourcing & Data Understanding](../04_Sources_Data_Understanding/sources_data_understanding.md)
- [Data Quality](../05_Data_Quality/data_quality.md)
- [Data Governance & Data Ownership](../06_Data_Governance_Ownership/data_governance_ownership.md)
- [As-Is / To-Be Analysis](../07_As-Is_To-Be/as_is_to_be.md)
- [Gap Analysis](../08_Gap_Analysis/gap_analysis.md)
- [Process Analysis](../09_Process_Analysis/process_analysis.md)
- [Data Mapping](../C_Data/01_Data_Mapping/data_mapping.md)
- [Data Modelling](../C_Data/02_Data_Modelling/data_modelling.md)
- [Data Flow / Data Lineage](../C_Data/03_Data_Flow_Data_Lineage/data_flow_data_lineage.md)
- [Target Solution](../11_Target_Solution/target_solution.md)
- [Power BI Reporting](../E_Visualization_Design/01_Power_BI_Reporting/power_bi_reporting.md)
