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
            |
            v
      Access Request
            |
            v
     IAM / Access Team
            |
            v
    Technical Provisioning
            |
            v
       Read-Only Access
