# Gap Analysis

This document identifies the main gaps between the current As-Is state and the proposed To-Be state of the Banking Customer Activity Analysis solution.

The purpose of the analysis is to identify what is missing, inconsistent, or requires improvement to achieve the target analytical solution.

---

<details>
<summary><strong>1. Gap Analysis Overview</strong></summary>

The gap analysis compares the current state with the desired future state across key areas of the analytical process.

The main focus areas are:

- data integration
- data quality
- business logic
- data traceability
- analytical dataset preparation
- reporting
- access and governance

</details>

---

<details>
<summary><strong>2. Gap Analysis Matrix</strong></summary>

| ID | Area | As-Is State | To-Be State | Identified Gap | Required Action |
|---|---|---|---|---|---|
| GAP-01 | Data Integration | Customer, transaction, and branch data are stored separately | Relevant data is combined into a consistent analytical view | No prepared customer activity dataset | Integrate relevant sources |
| GAP-02 | Data Quality | Data quality issues are identified during analysis | Defined quality checks are performed before analytical use | Quality validation is not yet standardized | Implement documented data quality checks |
| GAP-03 | Business Rules | Customer activity logic needs to be applied during analysis | Business rules are explicitly defined and consistently applied | Business logic is not centralized | Document and apply approved business rules |
| GAP-04 | Customer Coverage | Analytical results may focus on customers with transactions | All customers are retained in the target dataset | Customers without transactions may be omitted | Use customer-level base population and appropriate joins |
| GAP-05 | Analysis Period | Time filtering is performed during analysis | Analysis period is clearly defined and configurable | Period logic requires explicit implementation | Apply configurable period logic with a defined default |
| GAP-06 | Data Mapping | Source relationships are known but not fully documented | Source-to-target mappings are documented | Limited formal mapping | Create data mapping documentation |
| GAP-07 | Data Lineage | Source-to-output relationships require additional documentation | Data flow and lineage are documented | Traceability is incomplete | Document data flow and lineage |
| GAP-08 | Reporting | Data requires preparation before reporting | Prepared analytical data is available for Power BI | No dedicated reporting-ready target dataset | Create a reporting-ready analytical dataset |
| GAP-09 | Governance | Data ownership and access responsibilities are defined conceptually | Ownership and access responsibilities are formally documented | Governance needs structured documentation | Document ownership, access, and responsibilities |
| GAP-10 | Process | Data preparation and analysis steps are performed as separate activities | A defined end-to-end analytical process is documented | Process is not yet fully standardized | Document the target process |

</details>

---

<details>
<summary><strong>3. Data Integration Gap</strong></summary>

### Current State

The source data is distributed across:

- `CUSTOMER_DATA`
- `TRANSACTION_DATA`
- `BANK_DATA`

The datasets can be related through `CUSTOMER_ID` and `BRANCH_ID`, but the analytical customer activity view still requires data preparation.

### Target State

The relevant data sources are combined into a structured analytical dataset that supports customer-level analysis.

### Gap

There is no single prepared analytical view that combines the required customer, transaction, and branch information.

### Required Action

Create a target analytical dataset using the documented source relationships and required transformations.

</details>

---

<details>
<summary><strong>4. Data Quality Gap</strong></summary>

### Current State

The initial assessment identified:

- missing customer attributes
- missing `FIRM_REVENUE` values
- potential duplicate records
- the need to validate referential integrity

### Target State

Data quality checks are defined and performed before the data is used for analytical reporting.

### Gap

Data quality validation needs to be structured as a repeatable process rather than being performed only as ad hoc analysis.

### Required Action

Apply documented checks for:

- completeness
- validity
- consistency
- uniqueness
- referential integrity
- timeliness

</details>

---

<details>
<summary><strong>5. Business Logic Gap</strong></summary>

### Current State

Customer activity metrics and customer status depend on analytical logic being applied during data preparation.

### Target State

Business rules are explicitly documented and consistently applied.

### Gap

Without centralized business rules, different analyses could potentially interpret customer activity differently.

### Required Action

Use the documented Business Rules as the reference for:

- active customer definition
- transaction counting
- transaction amount calculations
- average transaction amount
- last transaction date
- missing value handling
- duplicate transaction handling

</details>

---

<details>
<summary><strong>6. Traceability Gap</strong></summary>

### Current State

The source tables and their relationships are known, but the complete path from source data to analytical output requires documentation.

### Target State

The analytical result can be traced back to the relevant source data, transformations, and business rules.

### Gap

Source-to-target traceability is not yet fully documented.

### Required Action

Create:

- Data Mapping
- Data Modelling
- Data Flow / Data Lineage

These artefacts should document how source data contributes to the final analytical dataset.

</details>

---

<details>
<summary><strong>7. Reporting Gap</strong></summary>

### Current State

The source data requires preparation before it can be effectively used for customer activity reporting.

### Target State

A structured analytical dataset is available for Power BI and further analysis.

### Gap

There is no finalized reporting-ready customer activity dataset.

### Required Action

Prepare a target dataset containing the required customer-level activity metrics and dimensions.

</details>

---

<details>
<summary><strong>8. Governance and Access Gap</strong></summary>

### Current State

Data ownership, approval, and access principles have been identified, but they require formal documentation.

### Target State

Data ownership and access responsibilities are clearly documented and aligned with the analytical process.

### Gap

Governance responsibilities and access controls need to be explicitly connected to the target analytical solution.

### Required Action

Document:

- Data Owners
- Data Analyst responsibilities
- access approval process
- role-based access
- regional access requirements
- read-only source access
- data accountability

</details>

---

<details>
<summary><strong>9. Prioritization of Gaps</strong></summary>

For this project, the gaps can be grouped according to their importance to the analytical solution:

| Priority | Gap | Reason |
|---|---|---|
| High | Data Integration | Required to create the target analytical dataset |
| High | Business Logic | Required for consistent customer activity calculations |
| High | Data Quality | Required to support reliable analytical results |
| High | Customer Coverage | Required to correctly represent the customer population |
| Medium | Data Mapping and Lineage | Required for traceability and maintainability |
| Medium | Reporting Preparation | Required for effective Power BI reporting |
| Medium | Governance Documentation | Required for controlled and transparent data use |
| Low | Process Standardization | Improves repeatability and future maintenance |

The prioritization is specific to this portfolio project and reflects the dependencies between the identified gaps and the target analytical output.

</details>

---

<details>
<summary><strong>10. Gap Resolution Approach</strong></summary>

The identified gaps are addressed through the following project activities:

```text
Identify Gaps
      ↓
Define Required Actions
      ↓
Validate Data Quality
      ↓
Document Business Rules
      ↓
Create Data Mapping
      ↓
Create Data Model
      ↓
Document Data Flow / Lineage
      ↓
Build Target Analytical Dataset
      ↓
Validate Results
      ↓
Prepare Power BI Reporting
```

The gap analysis therefore provides a connection between the current state and the activities required to reach the proposed target state.

</details>

---

<details>
<summary><strong>11. Expected Outcome</strong></summary>

The expected outcome of the gap analysis is a clear understanding of:

- what is missing in the current analytical process
- what needs to change to achieve the target state
- which activities are required to close the identified gaps
- how the required changes support the project requirements

The gap analysis provides a basis for the subsequent Solution Design and Target Solution documentation.

</details>

---

## Related Documentation

- [Requirements](../01_Requirements/requirements.md)
- [Business Rules](../03_Business_Rules/business_rules.md)
- [Data Sourcing & Data Understanding](../04_Sources_Data_Understanding/sources_data_understanding.md)
- [Data Quality](../05_Data_Quality/data_quality.md)
- [Data Governance & Data Ownership](../06_Data_Governance_Ownership/data_governance_ownership.md)
- [As-Is / To-Be Analysis](../07_As-Is_To-Be/as_is_to_be.md)
- [Data Mapping](../C_Data/01_Data_Mapping/data_mapping.md)
- [Data Modelling](../C_Data/02_Data_Modelling/data_modelling.md)
- [Data Flow / Data Lineage](../C_Data/03_Data_Flow_Data_Lineage/data_flow_data_lineage.md)
- [Solution Design](../10_Solution_Design/solution_design.md)
- [Target Solution](../11_Target_Solution/target_solution.md)
