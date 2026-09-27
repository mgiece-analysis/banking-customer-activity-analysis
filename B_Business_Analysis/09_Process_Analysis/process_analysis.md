# Process Analysis

This document describes the current and proposed analytical process for preparing customer activity data. The purpose is to understand the sequence of activities, identify responsibilities and dependencies, and define a structured process for delivering reliable analytical data.

---

<details>
<summary><strong>1. Process Purpose</strong></summary>

The purpose of the process is to transform data from multiple source datasets into a validated and reporting-ready customer activity dataset.

The process connects:

- business requirements
- data sourcing
- data quality validation
- business rules
- data transformation
- analytical validation
- reporting

</details>

---

<details>
<summary><strong>2. As-Is Process</strong></summary>

The current analytical process consists of several separate activities:

```text
Business Need
      ↓
Identify Relevant Data
      ↓
Access Source Data
      ↓
Explore and Analyse Data
      ↓
Identify Data Quality Issues
      ↓
Perform Data Preparation
      ↓
Calculate Customer Activity Metrics
      ↓
Perform Analysis / Reporting
```

The process relies on data from multiple sources and requires additional preparation before the data can be used consistently for reporting.

</details>

---

<details>
<summary><strong>3. To-Be Process</strong></summary>

The proposed process introduces a more structured and repeatable approach:

```text
Business Requirements
        ↓
Identify Data Sources
        ↓
Data Understanding
        ↓
Data Quality Checks
        ↓
Data Mapping & Modelling
        ↓
Apply Business Rules
        ↓
Create Target Analytical Dataset
        ↓
Validate Results
        ↓
Power BI / Further Analysis
```

Each step has a defined purpose and contributes to the creation of the final analytical output.

</details>

---

<details>
<summary><strong>4. Process Steps</strong></summary>

| Step | Process Activity | Main Output |
|---|---|---|
| 1 | Define business requirements | Documented requirements |
| 2 | Identify data sources | Source inventory |
| 3 | Understand source data | Data understanding documentation |
| 4 | Perform data quality checks | Identified and documented data quality issues |
| 5 | Map and model data | Data mapping and data model |
| 6 | Apply business rules | Consistent analytical logic |
| 7 | Prepare target dataset | Customer activity dataset |
| 8 | Validate analytical results | Validated output |
| 9 | Prepare reporting | Power BI-ready data and reporting |
| 10 | Document and maintain solution | Traceable and maintainable documentation |

</details>

---

<details>
<summary><strong>5. Roles and Responsibilities</strong></summary>

Different roles contribute to different parts of the analytical process.

| Role | Main Responsibility |
|---|---|
| Business Stakeholder | Defines business needs and expected outcomes |
| Data Owner | Confirms business definitions, ownership, and data usage |
| Data Analyst | Analyses data, documents requirements, rules, mappings, quality issues, and analytical results |
| Data / Technical Team | Supports technical data access and implementation activities |
| IAM / Access Team | Provisions approved technical access |
| Reporting User | Uses the prepared analytical output for reporting and analysis |

The exact responsibilities may differ in a production organization depending on the operating model.

</details>

---

<details>
<summary><strong>6. Process Inputs and Outputs</strong></summary>

### Main Inputs

- Business requirements
- Customer data
- Transaction data
- Branch data
- Business rules
- Access approvals
- Data quality requirements

### Main Outputs

- Validated analytical dataset
- Customer activity metrics
- Documented data mappings
- Data model
- Data lineage
- Data quality findings
- Power BI reporting dataset
- Analytical documentation

</details>

---

<details>
<summary><strong>7. Process Dependencies</strong></summary>

The process contains several important dependencies:

| Dependency | Description |
|---|---|
| Data Access → Data Analysis | Source data must be accessible before analysis can begin |
| Data Understanding → Data Mapping | Source structures and relationships must be understood before mapping |
| Data Quality → Analytical Metrics | Important quality issues should be identified before metrics are finalized |
| Business Rules → Target Dataset | Customer activity calculations depend on agreed business rules |
| Data Mapping → Target Solution | Source-to-target relationships support the target solution design |
| Validation → Reporting | Analytical output should be validated before reporting |

These dependencies help ensure that downstream activities are based on validated and understood inputs.

</details>

---

<details>
<summary><strong>8. Process Controls</strong></summary>

The following controls are included in the proposed process:

- source data is accessed in read-only mode
- required access is approved before provisioning
- data quality checks are performed before analytical use
- business rules are documented and applied consistently
- source-to-target relationships are documented
- analytical outputs are validated
- assumptions and identified issues are recorded
- data lineage supports traceability

These controls reduce the risk of incorrect or inconsistent analytical results.

</details>

---

<details>
<summary><strong>9. Process Improvement Areas</strong></summary>

The main areas for improvement between the current and proposed process are:

| Area | Improvement |
|---|---|
| Data Preparation | Use a defined and repeatable preparation process |
| Data Quality | Introduce documented quality checks |
| Business Logic | Centralize and document business rules |
| Traceability | Document source-to-target lineage |
| Reporting | Provide a dedicated reporting-ready dataset |
| Governance | Clearly document ownership and access responsibilities |
| Maintainability | Keep process and solution documentation structured |

</details>

---

<details>
<summary><strong>10. Process Success Criteria</strong></summary>

The process can be considered successful when:

- the relevant source datasets have been identified and understood
- required data quality checks have been completed
- business rules have been applied consistently
- all required customers are represented in the target dataset
- customer activity metrics have been validated
- the target dataset is suitable for reporting and further analysis
- the flow from source data to analytical output is documented
- access and governance requirements are respected

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
- [Solution Design](../10_Solution_Design/solution_design.md)
- [Target Solution](../11_Target_Solution/target_solution.md)
