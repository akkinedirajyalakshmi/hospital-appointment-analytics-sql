# Hospital Appointment Analytics | SQL

## Project Overview

This project analyzes hospital appointment data using SQL to identify
patterns in patient appointments, doctor performance, department
activity, and appointment attendance.

The analysis focuses on converting operational healthcare data into
meaningful insights that can support better appointment management
and performance monitoring.

---

## Business Objectives

- Analyze hospital appointment volumes
- Evaluate doctor appointment workloads
- Compare department-level performance
- Analyze patient appointment behavior
- Measure appointment no-show rates
- Analyze appointment lead-time patterns
- Compare doctor performance against department benchmarks
- Analyze appointment patterns across insurance types and patient demographics

---

## Dataset

The project contains three relational tables:

### Patients
Contains patient demographic and insurance information.

### Doctors
Contains doctor, department, experience, and consultation-time information.

### Appointments
Contains appointment dates, appointment types, lead time, doctor,
patient, department, and appointment status information.

---

## Key Analysis Areas

### Doctor Performance
- Top doctors by appointment volume
- Doctor workload analysis
- Doctor consultation-time comparison
- Comparison of doctors with department averages

### Department Analysis
- Appointment volume by department
- Department-level no-show rates
- Average appointment lead time
- Average patient age by department

### Patient Analysis
- Patient appointment frequency
- Patients with above-average appointment counts
- Patient distribution by city
- Patient demographic analysis

### Appointment Analysis
- Overall appointment volume
- Appointment status analysis
- No-show percentage
- No-show rate by department
- No-show rate by insurance type
- Appointment lead-time analysis

---

## SQL Skills Demonstrated

- SELECT
- WHERE
- GROUP BY
- HAVING
- ORDER BY
- DISTINCT
- CASE WHEN
- Aggregate Functions
- INNER JOIN
- LEFT JOIN
- Subqueries
- Nested Subqueries
- Correlated Subqueries
- Window Functions
- RANK()
- DENSE_RANK()
- OVER()

---

## Key Insights

The analysis helps identify:

- Doctors handling high appointment volumes
- Departments with higher appointment demand
- Departments with higher no-show rates
- Patient appointment frequency patterns
- Appointment scheduling patterns
- Insurance-wise attendance patterns
- Doctor performance relative to department benchmarks

---

## Project Structure

```text
hospital-appointment-analytics-sql/
│
├── README.md
├── Hospital dataset.sql
└── queries.sql
