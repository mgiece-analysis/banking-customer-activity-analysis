# As-Is / To-Be Analysis

This document describes the current state (As-Is) and the proposed future state (To-Be) of the customer activity analysis process.

The purpose of the analysis is to identify how data is currently structured and used, and how it should be organized to support consistent customer activity analysis and reporting.

---

<details>
<summary><strong>1. As-Is State</strong></summary>

Currently, customer, transaction, and branch information is stored in separate datasets.

The main characteristics of the current state are:

- Customer information is stored in `CUSTOMER_DATA`.
- Transaction activity is stored in `TRANSACTION_DATA`.
- Branch information is stored in `BANK_DATA`.
- The datasets can be connected through `CUSTOMER_ID` and `BRANCH_ID`.
- Data quality issues, such as missing values, require validation before analytical use.
- Customer and transaction information is not yet presented as one prepared analytical dataset.
- Business rules for customer activity need to be applied consistently during analysis.
- Reporting and analytical use requires additional data preparation and transformation.

### As-Is Data Flow

```text
CUSTOMER_DATA
      +
TRANSACTION_DATA
      +
BANK_DATA
      ↓
Data Validation
      ↓
Data Preparation
      ↓
SQL Analysis
      ↓
Reporting / Further Analysis
```

</details>

---

<details>
<summary><strong>2. Key As-Is Challenges</strong></summary>

The current state presents several challenges:

| Area | Current Situation | Potential Impact |
|---|---|---|
| Data Distribution | Data is stored in separate datasets | Additional preparation is required |
| Data Quality | Missing and potentially inconsistent values exist | May affect analytical results |
| Customer Activity | Activity must be calculated from transaction data | Additional transformation logic is required |
| Business Rules | Activity definitions need to be applied consistently | Risk of inconsistent interpretation |
| Data Traceability | Multiple sources contribute to the analysis | Source-to-output relationships need documentation |
| Reporting | Data is not yet organized as a reporting-ready customer activity dataset | Additional preparation is required |

</details>

---

<details>
<summary><strong>3. To-Be State</strong></summary>

The proposed To-Be state is a structured analytical solution that combines the relevant source data and applies defined business rules and data quality controls.

The target state should provide:

- a consistent customer-level analytical view
- customer activity metrics
- customer type and regional attributes
- configurable analysis periods
- clearly defined business rules
- validated and documented data relationships
- traceability from source data to analytical output
- reporting-ready data for Power BI
- controlled access to analytical data

### To-Be Data Flow

```text
CUSTOMER_DATA
      +
TRANSACTION_DATA
      +
BANK_DATA
      ↓
Data Quality Checks
      ↓
Data Mapping & Transformation
      ↓
Business Rules
      ↓
Target Customer Activity Dataset
      ↓
Power BI / Analytical Reporting
```

</details>

---

<details>
<summary><strong>4. As-Is vs To-Be Comparison</strong></summary>

| Area | As-Is | To-Be |
|---|---|---|
| Data Sources | Separate datasets | Integrated analytical data view |
| Data Quality | Issues identified during analysis | Defined quality checks before analytical use |
| Customer Activity | Calculated during analysis | Defined and consistently calculated using business rules |
| Analysis Period | Requires analytical filtering | Configurable analysis period with defined default |
| Customer Coverage | Depends on analysis logic | All customers retained in the target dataset |
| Data Relationships | Implicit through source keys | Documented through data mapping and lineage |
| Reporting | Requires data preparation | Reporting-ready analytical dataset |
| Traceability | Requires additional documentation | Source-to-output traceability is documented |
| Access | Source access controlled separately | Analytical access follows defined access principles |

</details>

---

<details>
<summary><strong>5. Target Business Process</strong></summary>

The proposed future process can be summarized as:

```text
Identify Business Need
        ↓
Define Requirements
        ↓
Identify Data Sources
        ↓
Validate Data Quality
        ↓
Map and Model Data
        ↓
Apply Business Rules
        ↓
Create Target Analytical Dataset
        ↓
Validate Results
        ↓
Provide Reporting / Analysis
```

The process creates a clear relationship between business requirements, source data, analytical logic, and the final reporting output.

</details>

---

<details>
<summary><strong>6. Expected Benefits of the To-Be State</strong></summary>

The proposed state is intended to provide:

- more consistent customer activity analysis
- clearer data relationships
- repeatable analytical logic
- improved data quality visibility
- better traceability
- easier reporting and visualization
- a maintainable basis for further analytical use

</details>

---

## Related Documentation

- [Requirements](../01_Requirements/requirements.md)
- [Business Rules](../03_Business_Rules/business_rules.md)
- [Data Sourcing & Data Understanding](../04_Sources_Data_Understanding/sources_data_understanding.md)
- [Data Quality](../05_Data_Quality/data_quality.md)
- [Data Governance & Data Ownership](../06_Data_Governance_Ownership/data_governance_ownership.md)
- [Data Mapping](../C_Data/01_Data_Mapping/data_mapping.md)
- [Data Modelling](../C_Data/02_Data_Modelling/data_modelling.md)
- [Data Flow / Data Lineage](../C_Data/03_Data_Flow_Data_Lineage/data_flow_data_lineage.md)
- [Gap Analysis](../08_Gap_Analysis/gap_analysis.md)
