# Agile / Scrum

This document describes how Agile and Scrum concepts can be applied to the Banking Customer Activity Analysis project.

The project is a portfolio-based analytical project. It is structured using Agile/Scrum principles to simulate an iterative delivery process and demonstrate how an analyst can organize, prioritize, and deliver analytical work in a Scrum-oriented environment.

---

<details>
<summary><strong>1. Agile Approach</strong></summary>

Agile is an approach to delivering work iteratively and incrementally, with a focus on collaboration, feedback, and adaptation to changing needs.

For the Banking Customer Activity Analysis project, an Agile approach means that the solution is developed in smaller stages rather than being designed and completed all at once.

Key principles applied to the project include:

- iterative delivery
- incremental development
- continuous validation
- feedback and adjustment
- collaboration between business and technical roles
- prioritization of the most valuable work first

Example:

```text
Requirements
      ↓
Data Understanding
      ↓
Data Quality
      ↓
Data Design
      ↓
Implementation
      ↓
Validation
      ↓
Reporting
```

Each stage provides an incremental part of the final solution.

</details>

---

<details>
<summary><strong>2. Scrum Framework</strong></summary>

Scrum is an Agile framework used to organize work through short, iterative cycles called Sprints.

The main Scrum concepts relevant to this project are:

| Concept | Application in This Project |
|---|---|
| Product Backlog | List of project requirements, analytical tasks, and deliverables |
| Sprint | A defined period used to complete a selected group of tasks |
| Sprint Goal | The main objective of a Sprint |
| Increment | A completed and usable part of the analytical solution |
| Product Backlog Refinement | Reviewing, clarifying, and preparing upcoming work |

For this project, Scrum concepts are used as a practical framework for organizing the work.

</details>

---

<details>
<summary><strong>3. Scrum Roles</strong></summary>

A Scrum Team consists of the Product Owner, Scrum Master, and Developers.

For a data-oriented project such as Banking Customer Activity Analysis, responsibilities could be represented as follows:

| Role | Example Responsibility in the Project |
|---|---|
| Product Owner | Defines business value, priorities, and expected outcomes |
| Scrum Master | Supports the team in applying Scrum and removing process impediments |
| Developers | Create the Increment and contribute to the technical or analytical solution |
| Data Analyst / Business Analyst | Analyses requirements, data, business rules, and analytical needs |
| Data Engineer | Supports data transformation and technical implementation |
| BI Developer | Supports reporting and visualization |
| Data Owner | Provides business ownership, definitions, and data-related decisions |

In a real Scrum Team, Data Analysts, Data Engineers, and BI Developers may contribute to the Developers accountabilities when they are involved in creating the Increment.

For this portfolio project, the work is performed individually. The roles above are therefore used to model how responsibilities could be distributed in a real team.

</details>

---

<details>
<summary><strong>4. Product Backlog & Backlog Management</strong></summary>

The Product Backlog represents the ordered list of work required to deliver the analytical solution.

For this project, the backlog can contain larger work items as well as smaller implementation tasks.

A simplified hierarchy is:

```text
Epic
  ↓
User Story
  ↓
Tasks
```

Example:

```text
Epic: Customer Activity Analysis

User Story:
As a Data Analyst, I want to analyse customer transaction activity
so that I can identify customer activity patterns.

Tasks:
- Understand source data
- Validate data quality
- Create data mapping
- Design data model
- Implement SQL transformations
- Validate target dataset
- Create Power BI report
```

Backlog management includes:

- defining work items
- clarifying requirements
- identifying dependencies
- prioritizing work
- preparing tasks for upcoming Sprints

The backlog can be updated when new information, data findings, or requirements are identified.

</details>

---

<details>
<summary><strong>5. User Stories and Acceptance Criteria</strong></summary>

User Stories describe a requirement from the perspective of the user.

For this project, the main User Story is:

> **As a Data Analyst, I want to analyse customer transaction activity across customer, transaction, and branch data, so that I can identify customer activity patterns and prepare reliable information for reporting and further analysis.**

Acceptance Criteria define the conditions that must be satisfied for the User Story to be considered acceptable.

Examples include:

- all customers are included in the output
- customers without transactions remain in the dataset
- the analysis period can be changed
- customer activity metrics are calculated correctly
- active customers are identified according to the defined business rule
- the output is suitable for reporting

Detailed User Story and Acceptance Criteria documentation is maintained separately in the Business / Analysis section.

</details>

---

<details>
<summary><strong>6. Sprint Planning & Sprint Goal</strong></summary>

Sprint Planning is used to determine which work will be completed during a Sprint and what the Sprint is expected to achieve.

For this portfolio project, the work can be organized into simulated Sprints.

### Sprint 1 – Requirements & Data Understanding

**Sprint Goal:** Define the business need and understand the available data.

Planned work:

- Business Case
- Requirements
- User Story
- Acceptance Criteria
- Data Sourcing & Data Understanding

### Sprint 2 – Data Quality & Data Design

**Sprint Goal:** Prepare the analytical data design and identify data quality requirements.

Planned work:

- Business Rules
- Data Quality
- Data Governance
- As-Is / To-Be
- Gap Analysis
- Process Analysis
- Data Mapping
- Data Modelling

### Sprint 3 – Solution & Implementation

**Sprint Goal:** Design and implement the target analytical dataset.

Planned work:

- Solution Design
- Target Solution
- Data Flow / Data Lineage
- SQL / Snowflake implementation
- validation

### Sprint 4 – Integrations & Reporting

**Sprint Goal:** Complete the supporting integration and reporting elements.

Planned work:

- API Integration Analysis
- Postman / API Testing
- Power BI Reporting
- UI Prototype
- UML Sequence Diagram
- Mermaid Data Flow
- documentation

The Sprint structure is used as a practical simulation of iterative delivery.

</details>

---

<details>
<summary><strong>7. Scrum Events</strong></summary>

The main Scrum events relevant to the project are:

### Sprint Planning

Defines the Sprint Goal and the work selected for the Sprint.

### Daily Scrum

A short synchronization event used by a team to inspect progress and identify impediments.

For this individual portfolio project, the Daily Scrum is simulated as a short personal progress review.

Example:

```text
What was completed?
        ↓
What is planned next?
        ↓
Are there any blockers?
```

### Sprint Review

Used to inspect the completed Increment and collect feedback.

For this project, the Sprint Review can be simulated by reviewing completed project artefacts and checking them against requirements.

### Sprint Retrospective

Used to reflect on the way of working and identify improvements.

For this project, retrospective questions may include:

- What worked well?
- What caused delays?
- What should be changed in the next Sprint?
- Which documentation or technical steps need improvement?

</details>

---

<details>
<summary><strong>8. Definition of Done</strong></summary>

Definition of Done is the shared understanding of what it means for an Increment to be complete.

For this project, an item can be considered Done when the relevant work has been:

- completed
- validated
- documented
- checked against the applicable Acceptance Criteria
- stored in the appropriate GitHub location

For example, a SQL task can be considered Done when:

```text
SQL implemented
      ↓
Result validated
      ↓
Business Rule checked
      ↓
Documentation updated
      ↓
Acceptance Criteria satisfied
      ↓
Done
```

The Definition of Done helps ensure that work is not considered complete only because the technical implementation has been written.

</details>

---

<details>
<summary><strong>9. Team Collaboration & Dependencies</strong></summary>

A data-oriented project usually requires cooperation between multiple roles.

A simplified collaboration model is:

```text
Product Owner
      ↓
Business / Data Analyst
      ↓
Data Engineer
      ↓
BI / Reporting
```

The Data Owner may provide business definitions, data ownership decisions, and access approval across the process.

Important dependencies in the project include:

| Dependency | Example |
|---|---|
| Business → Analysis | Requirements must be understood before solution design |
| Data Access → Analysis | Source data must be available before detailed analysis |
| Data Understanding → Mapping | Source structures should be understood before field mapping |
| Data Quality → Metrics | Important quality issues should be identified before final metrics |
| Business Rules → Implementation | SQL logic depends on defined business rules |
| Data Model → Reporting | Reporting depends on an appropriate analytical structure |

Clear communication and documented dependencies help reduce rework and misunderstandings.

</details>

---

<details>
<summary><strong>10. Agile Application in Our Project</strong></summary>

Agile/Scrum principles are applied to this portfolio project as a structured simulation of a real analytical delivery process.

The project is divided into smaller increments rather than being completed in one step.

A simplified delivery flow is:

```text
Product Backlog
      ↓
Sprint Planning
      ↓
Requirements & Data Understanding
      ↓
Data Quality & Data Design
      ↓
Solution & Snowflake Implementation
      ↓
Validation
      ↓
API & Reporting
      ↓
Review
      ↓
Retrospective
      ↓
Next Increment
```

The project also uses GitHub to organize and track project artefacts.

The main Agile principles demonstrated in the project are:

- iterative delivery
- incremental progress
- prioritization
- validation and feedback
- collaboration between business and technical perspectives
- continuous improvement

Because this is an individual portfolio project, Scrum roles and events are simulated rather than performed by a real Scrum Team.

This distinction is important when presenting the project professionally: the project demonstrates practical understanding of Agile/Scrum ways of working without claiming commercial Scrum Team experience.

</details>

---

## Related Documentation

- [Business Case](../../B_Business_Analysis/00_Business_Case/business_case.md)
- [Requirements](../../B_Business_Analysis/01_Requirements/requirements.md)
- [User Story & Acceptance Criteria](../../B_Business_Analysis/02_User_Story_Acceptance_Criteria/user_story.md)
- [Process Analysis](../../B_Business_Analysis/09_Process_Analysis/process_analysis.md)
- [Solution Design](../../B_Business_Analysis/10_Solution_Design/solution_design.md)
- [Target Solution](../../B_Business_Analysis/11_Target_Solution/target_solution.md)
- [Data Mapping](../../C_Data/01_Data_Mapping/data_mapping.md)
- [Data Modelling](../../C_Data/02_Data_Modelling/data_modelling.md)
- [Data Flow / Data Lineage](../../C_Data/03_Data_Flow_Data_Lineage/data_flow_data_lineage.md)
