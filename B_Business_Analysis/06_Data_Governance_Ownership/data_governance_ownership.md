# Data Governance & Data Ownership

This document describes the governance and ownership principles applied to the Banking Customer Activity Analysis project. It defines data ownership, responsibilities, access management, and accountability for the main data sources.

---

<details>
<summary><strong>1. Purpose of Data Governance</strong></summary>

Data governance provides a framework for managing data consistently throughout its lifecycle.

In this project, governance focuses on:

- data ownership and accountability
- data access and authorization
- data quality responsibilities
- data definitions and business rules
- data lineage and traceability
- appropriate use of analytical data
- protection of source data

The purpose is to ensure that data is understandable, controlled, and used appropriately for analytical activities.

</details>

---

<details>
<summary><strong>2. Data Ownership</strong></summary>

Data ownership is assigned to the business domain responsible for the relevant data.

For this project, the following ownership model is assumed:

| Data Source | Business Domain / Data Owner | Main Responsibility |
|---|---|---|
| `CUSTOMER_DATA` | Customer Domain | Customer data definitions, business meaning, and data quality ownership |
| `TRANSACTION_DATA` | Transaction / Payments Domain | Transaction data definitions and business rules |
| `BANK_DATA` | Branch Operations | Branch and regional data definitions |

Data ownership in this project is used as a practical example of how responsibilities can be assigned in a banking data environment.

</details>

---

<details>
<summary><strong>3. Data Owner Responsibilities</strong></summary>

Data Owners are responsible for the business aspects of the data.

Typical responsibilities include:

- defining the business meaning of data elements
- approving business definitions and rules
- supporting data quality issue resolution
- approving appropriate access to data
- confirming whether data can be used for a specific business purpose
- maintaining accountability for the data domain

The Data Owner is not necessarily responsible for implementing technical data pipelines or performing every data quality check.

</details>

---

<details>
<summary><strong>4. Data Analyst Responsibilities</strong></summary>

The Data Analyst is responsible for the analytical and documentation aspects of the project.

Responsibilities include:

- understanding source data
- analysing data quality
- documenting data mappings and relationships
- documenting data lineage
- translating business needs into analytical requirements
- applying approved business rules
- documenting assumptions and identified issues
- communicating data findings to relevant stakeholders
- ensuring analytical outputs are traceable to source data

The Data Analyst does not act as the business Data Owner.

</details>

---

<details>
<summary><strong>5. Data Access Management</strong></summary>

Access to data should be provided according to the user's role and business need.

A simplified access process used in this project is:

```text
Business / Data Owner Approval
              ↓
        Access Request
              ↓
       IAM / Access Team
              ↓
   Technical Provisioning
              ↓
       Read-Only Access
```

The project assumes that access to the source datasets is read-only.

Source data should not be modified as part of the analytical process.

</details>

---

<details>
<summary><strong>6. Role-Based Access</strong></summary>

Analytical data access should follow role-based access principles.

Access may depend on:

- user's organizational role
- business purpose
- data domain
- geographical or regional responsibilities
- required level of data visibility

Users should have access only to the data required for their responsibilities.

Where regional restrictions apply, users should only be able to access the relevant regional data.

</details>

---

<details>
<summary><strong>7. Data Classification and Sensitivity</strong></summary>

Banking data may contain information that requires controlled access.

For this project, data should be treated as business-controlled analytical data rather than freely distributable information.

Potentially sensitive customer-related attributes should not be unnecessarily exposed in analytical outputs.

The project focuses on analytical use of the data and does not require publishing personally identifiable customer information.

Any production implementation would require the organization's formal data classification and security policies to be applied.

</details>

---

<details>
<summary><strong>8. Data Quality Governance</strong></summary>

Data quality is a shared responsibility between business Data Owners and technical or analytical teams.

A simplified responsibility model is:

| Activity | Primary Responsibility |
|---|---|
| Define business meaning | Data Owner |
| Define business rules | Data Owner + Business Analyst |
| Identify data quality issues | Data Analyst / Technical Team |
| Investigate business impact | Data Owner + Analyst |
| Correct source-system issues | Source System / Data Owner |
| Document identified issues | Data Analyst |
| Validate analytical output | Data Analyst |

Data quality issues should be documented, assessed, and communicated to the appropriate Data Owner.

</details>

---

<details>
<summary><strong>9. Data Lineage and Traceability</strong></summary>

Analytical outputs should be traceable back to their source data.

For this project, lineage should make it possible to understand:

- where the data originated
- which source tables were used
- how datasets were joined
- which business rules were applied
- which transformations were performed
- how the final analytical metrics were calculated

This supports transparency, validation, troubleshooting, and future maintenance.

Detailed data lineage is documented separately in the Data Flow / Data Lineage artefact.

</details>

---

<details>
<summary><strong>10. Governance of Business Definitions</strong></summary>

Business definitions should be agreed with the appropriate business stakeholders and Data Owners.

Examples include:

- definition of an active customer
- definition of a valid transaction
- interpretation of customer type
- meaning of regional attributes
- treatment of missing values
- treatment of duplicate transactions

Once agreed, these definitions should be documented and applied consistently across analytical outputs.

Detailed business logic is documented separately in the Business Rules artefact.

</details>

---

<details>
<summary><strong>11. Access Approval Scenario</strong></summary>

For the purpose of this project, a practical access approval scenario is assumed:

1. The Data Analyst identifies the required data sources.
2. The analyst contacts the relevant Data Owners.
3. Data Owners review and approve the requested access.
4. The approvals are attached to the access request.
5. The IAM / Access Management team provisions the required access.
6. The analyst receives read-only access to the approved data.

This scenario reflects a controlled approach to accessing business data and separates business authorization from technical provisioning.

</details>

---

<details>
<summary><strong>12. Governance Principles</strong></summary>

The project follows the following governance principles:

| Principle | Application |
|---|---|
| Ownership | Each data domain has a responsible business owner |
| Accountability | Data Owners remain accountable for the business use and definition of their data |
| Access Control | Access is granted based on role and business need |
| Read-Only Source Access | Source data is not modified during analysis |
| Traceability | Analytical outputs can be traced to source data |
| Consistency | Business definitions and rules are applied consistently |
| Transparency | Assumptions and data quality issues are documented |
| Least Privilege | Users should receive only the access required for their responsibilities |

</details>

---

## Related Documentation

- [Requirements](../01_Requirements/requirements.md)
- [Business Rules](../03_Business_Rules/business_rules.md)
- [Data Sourcing & Data Understanding](../04_Sources_Data_Understanding/sources_data_understanding.md)
- [Data Quality](../05_Data_Quality/data_quality.md)
- [Data Mapping](../C_Data/01_Data_Mapping/data_mapping.md)
- [Data Flow / Data Lineage](../C_Data/03_Data_Flow_Data_Lineage/data_flow_data_lineage.md)
