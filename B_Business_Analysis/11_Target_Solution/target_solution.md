# Target Solution

This document describes the proposed target analytical solution for the Banking Customer Activity Analysis project.

The Target Solution represents the desired end state of the analytical process based on the defined requirements, business rules, data understanding, gap analysis, and solution design.

---

<details>
<summary><strong>1. Target Solution Overview</strong></summary>

The proposed target solution provides a consistent customer-level analytical view by combining customer, transaction, and branch data.

The target solution is designed to:

- integrate relevant data sources
- apply defined business rules
- perform data quality validation
- provide customer activity metrics
- support customer, regional, customer-type, and time-based analysis
- provide reporting-ready data for Power BI
- maintain traceability from source data to analytical output
- preserve controlled and read-only access to source data

The target solution represents the proposed end state of the analytical process. The solution will subsequently be implemented and validated using Snowflake and SQL.

</details>

---

<details>
<summary><strong>2. Target Solution Architecture</strong></summary>

The high-level target solution can be represented as follows:

```text
CUSTOMER_DATA
TRANSACTION_DATA
BANK_DATA
      ↓
Source Data Validation
      ↓
Data Integration
      ↓
Data Transformation
      ↓
Business Rules
      ↓
Target Customer Activity Dataset
      ↓
Validation
      ↓
Power BI / Further Analysis
```

The target solution separates the source data from the analytical output and provides a structured flow from source information to reporting.

</details>

---

<details>
<summary><strong>3. Target Analytical Dataset</strong></summary>

The main output of the solution is a customer-level analytical dataset.

The target dataset is expected to contain one record per customer for the selected analysis period.

### Target Attributes

| Attribute | Description |
|---|---|
| `CUSTOMER_ID` | Unique customer identifier |
| `AGE` | Customer age |
| `CUSTOMER_TYPE` | Customer classification |
| `CITY` | Customer city |
| `REGION` | Customer region |
| `BRANCH_ID` | Associated branch identifier |
| `BANK_NAME` | Bank name |
| `TRANSACTION_COUNT` | Number of valid transactions during the selected period |
| `TOTAL_TRANSACTION_AMOUNT` | Total transaction amount during the selected period |
| `AVG_TRANSACTION_AMOUNT` | Average transaction amount during the selected period |
| `LAST_TRANSACTION_DATE` | Latest transaction date during the selected period |
| `ACTIVITY_STATUS` | Customer activity classification |

The final structure may be adjusted during implementation if technical or analytical requirements identify a necessary change.

</details>

---

<details>
<summary><strong>4. Source-to-Target Integration</strong></summary>

The target solution combines information from the three source datasets.

### Main Relationships

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

The customer dataset provides the base customer population, transaction data provides customer activity, and branch data provides additional branch and regional information.

The detailed field-level mapping is documented separately in the Data Mapping artefact.

</details>

---

<details>
<summary><strong>5. Target Business Logic</strong></summary>

The target solution applies the documented business rules consistently.

Key logic includes:

- the default analysis period covers the last three months relative to the latest available transaction date
- the analysis period can be changed
- all customers are included in the target dataset
- customers without transactions remain in the output
- customers without transactions have `TRANSACTION_COUNT = 0`
- customers without transactions have `TOTAL_TRANSACTION_AMOUNT = 0`
- customers without transactions have `AVG_TRANSACTION_AMOUNT = NULL`
- customers without transactions have `LAST_TRANSACTION_DATE = NULL`
- a customer is classified as Active when they have at least 3 valid transactions in the selected period
- missing customer type is represented as `Unknown`
- confirmed duplicate transactions must not inflate analytical metrics

The detailed logic is maintained in the Business Rules document.

</details>

---

<details>
<summary><strong>6. Data Quality and Validation</strong></summary>

The target solution includes validation before the analytical output is used for reporting.

Validation covers:

- required field completeness
- identifier validity
- duplicate detection
- referential integrity
- valid transaction values
- valid transaction dates
- consistency between related datasets
- consistency of calculated customer metrics

The target output should be validated against the defined business rules and acceptance criteria.

Detailed data quality checks are documented separately.

</details>

---

<details>
<summary><strong>7. Target Data Flow</strong></summary>

The proposed target data flow is:

```text
Source Systems
      ↓
CUSTOMER_DATA
TRANSACTION_DATA
BANK_DATA
      ↓
Data Quality Checks
      ↓
Data Integration
      ↓
Data Transformation
      ↓
Business Rules
      ↓
CUSTOMER_ACTIVITY
      ↓
Validation
      ↓
Power BI
```

This flow provides a clear path from source data to the final analytical output.

Detailed source-to-target lineage is documented in the Data Flow / Data Lineage artefact.

</details>

---

<details>
<summary><strong>8. Reporting and Analytical Usage</strong></summary>

The target dataset is designed to support:

- customer activity reporting
- active versus inactive customer analysis
- transaction volume analysis
- transaction value analysis
- customer type analysis
- regional analysis
- time-based analysis
- further analytical activities

Power BI will use the prepared analytical dataset as the basis for reporting and visualization.

The core analytical logic should be established before the data reaches the reporting layer to promote consistency across reports.

</details>

---

<details>
<summary><strong>9. Access and Governance</strong></summary>

The target solution follows the governance principles defined for the project.

Key principles include:

- source data is accessed in read-only mode
- data access is based on role and business need
- regional restrictions may be applied where required
- data ownership remains with the relevant business domain
- analytical outputs should be traceable to source data
- potentially sensitive customer attributes should not be unnecessarily exposed

The target solution does not modify the source systems.

</details>

---

<details>
<summary><strong>10. Target State Process</strong></summary>

The target operating process can be summarized as:

```text
Business Need
      ↓
Requirements
      ↓
Data Sourcing & Understanding
      ↓
Data Quality Validation
      ↓
Data Mapping & Modelling
      ↓
Business Rules
      ↓
Target Dataset Creation
      ↓
Analytical Validation
      ↓
Power BI Reporting
```

This creates a repeatable process from business need through to analytical reporting.

</details>

---

<details>
<summary><strong>11. Implementation Approach</strong></summary>

The target solution will be implemented incrementally.

The planned implementation activities include:

1. Validate source data in Snowflake.
2. Create the required source-to-target mappings.
3. Prepare the target data model.
4. Implement transformations using SQL.
5. Apply the defined business rules.
6. Perform data quality and result validation.
7. Create the target customer activity dataset.
8. Use the prepared dataset for Power BI reporting.

The implementation will be documented through SQL scripts and other project artefacts.

</details>

---

<details>
<summary><strong>12. Target Solution vs Current State</strong></summary>

| Area | Current State | Target Solution |
|---|---|---|
| Data | Separate source datasets | Structured analytical view |
| Business Logic | Applied during analysis | Explicitly documented and consistently applied |
| Data Quality | Issues identified during analysis | Defined and repeatable validation |
| Customer Coverage | Requires analytical handling | All customers retained |
| Traceability | Requires additional documentation | Source-to-output lineage documented |
| Reporting | Requires additional preparation | Reporting-ready analytical dataset |
| Governance | Principles identified | Ownership and access responsibilities documented |
| Process | Several separate activities | Structured end-to-end analytical process |

</details>

---

<details>
<summary><strong>13. Final Target State</strong></summary>

The final target state is a validated customer-level analytical dataset created from the relevant source data and prepared according to defined business rules and data quality requirements.

The target solution provides:

```text
Consistent Customer View
        ↓
Customer Activity Metrics
        ↓
Customer / Region / Time Analysis
        ↓
Validated Analytical Dataset
        ↓
Power BI Reporting
```

The solution is designed to provide a clear, traceable, and maintainable basis for customer activity analysis.

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
- [Solution Design](../10_Solution_Design/solution_design.md)
- [Data Mapping](../../C_Data/01_Data_Mapping/data_mapping.md)
- [Data Modelling](../../C_Data/02_Data_Modelling/data_modelling.md)
- [Data Flow / Data Lineage](../../C_Data/03_Data_Flow_Data_Lineage/data_flow_data_lineage.md)
