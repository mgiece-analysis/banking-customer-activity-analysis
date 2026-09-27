# Requirements

This document defines the key requirements for the Banking Customer Activity Analysis project. It describes the business need, project objective, scope, expected outcome, and the main business, functional, and non-functional requirements.

---

<details>
<summary><strong>1. Context / Business Need</strong></summary>

The bank has customer, transaction, and branch-related data stored in separate data sources. To perform consistent customer activity analysis, these datasets need to be understood, combined, and prepared for reporting and further analysis.

The current data is distributed across:

- `CUSTOMER_DATA` – customer information
- `TRANSACTION_DATA` – transaction and financial activity
- `BANK_DATA` – branch and regional information

The main business need is to create a consistent customer activity view that combines customer characteristics with transaction activity and relevant regional information.

This will support reporting, customer activity analysis, segmentation, and further analytical use cases.

</details>

---

<details>
<summary><strong>2. Objective</strong></summary>

The objective of the project is to design and prepare a consistent customer activity dataset that enables analysis of:

- customer transaction activity
- transaction volume and value
- customer types and segments
- regional differences
- time-based activity
- active and inactive customers

The solution should provide a structured and traceable approach from source data to analytical output.

</details>

---

<details>
<summary><strong>3. Scope</strong></summary>

### In Scope

- Analysis of customer, transaction, and branch data
- Data source identification and understanding
- Data quality assessment
- Definition of business and functional requirements
- Definition of business rules
- Data mapping and data modelling
- Data flow and data lineage documentation
- As-Is and To-Be analysis
- Gap analysis
- Process analysis
- Solution design
- Preparation of a target analytical dataset
- SQL-based data analysis in Snowflake
- Power BI reporting
- Basic API integration analysis
- Documentation of the solution and analytical process

### Out of Scope

- Modification of source systems
- Production implementation of data pipelines
- Development of production APIs
- Advanced machine learning models
- Real-time production integration
- Changes to source data structures

</details>

---

<details>
<summary><strong>4. Expected Outcome</strong></summary>

The expected outcome is a structured analytical solution that provides:

- a consistent customer-level view of activity
- transaction activity metrics
- customer and regional analysis
- time-based analysis
- defined business rules
- documented data mappings and relationships
- documented data flows and lineage
- identified data quality issues
- clear As-Is and To-Be states
- a proposed target solution
- reporting-ready data for Power BI

The solution should also provide sufficient documentation to allow another analyst or stakeholder to understand how the data is sourced, transformed, validated, and used.

</details>

---

<details>
<summary><strong>5. Business Requirements</strong></summary>

| ID | Business Requirement |
|---|---|
| BR-01 | Provide a consistent view of customers and their activity across relevant data sources. |
| BR-02 | Enable analysis of customer transaction activity, including transaction count and transaction value. |
| BR-03 | Enable customer analysis by customer type and region. |
| BR-04 | Enable time-based analysis using a configurable analysis period. |
| BR-05 | Provide data that can be used for reporting and further analytical activities. |
| BR-06 | Support controlled access to analytical data according to business and regional access requirements. |

</details>

---

<details>
<summary><strong>6. Functional Requirements</strong></summary>

| ID | Functional Requirement |
|---|---|
| FR-01 | The solution shall allow the analysis period to be selected or changed. |
| FR-02 | The default analysis period shall cover the last three months relative to the latest available transaction date. |
| FR-03 | The solution shall calculate the number of transactions per customer for the selected period. |
| FR-04 | The solution shall calculate the total transaction amount per customer for the selected period. |
| FR-05 | The solution shall calculate the average transaction amount per customer for the selected period. |
| FR-06 | The solution shall provide the latest transaction date for each customer within the selected period. |
| FR-07 | The solution shall identify active customers based on the defined business rule. |
| FR-08 | The target dataset shall include all customers, including customers with no transactions in the selected period. |
| FR-09 | The data shall support filtering and aggregation by customer type, region, and analysis period. |
| FR-10 | The target data shall be suitable for reporting and visualization in Power BI. |

</details>

---

<details>
<summary><strong>7. Non-Functional Requirements</strong></summary>

| ID | Non-Functional Requirement |
|---|---|
| NFR-01 | The solution shall include data quality controls covering completeness, consistency, and validity. |
| NFR-02 | Access to analytical data shall follow role-based access principles. |
| NFR-03 | Where applicable, access shall support regional restrictions. |
| NFR-04 | Source data shall be accessed in read-only mode and shall not be modified by the analytical solution. |
| NFR-05 | The analytical dataset is assumed to be refreshed daily. |
| NFR-06 | The solution shall provide traceability from analytical output back to the relevant source data. |
| NFR-07 | The solution and its documentation shall be maintainable and understandable for future users or analysts. |

</details>

---

## Related Documentation

The following topics are documented separately as part of the project:

- [Business Rules](../03_Business_Rules/business_rules.md)
- [Data Sourcing & Data Understanding](../04_Sources_Data_Understanding/sources_data_understanding.md)
- [Data Quality](../05_Data_Quality/data_quality.md)
- [Data Governance & Data Ownership](../06_Data_Governance_Ownership/data_governance_ownership.md)
- [Acceptance Criteria](../02_User_Story_Acceptance_Criteria/acceptance_criteria.md)
