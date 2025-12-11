# Hospital Management SQL Database

## Overview
This project models a small hospital system using a relational database.  
It includes tables for patients, staff, appointments, departments, billing, and prescriptions.  
The goal is to support real-world hospital operations such as scheduling, tracking treatments, and generating reports.

## Features
- Fully relational SQL schema  
- Sample data for testing and exploration  
- Queries for scheduling, revenue reporting, and patient history  
- Demonstrates joins, constraints, indexing, and normalization

## Files Included
- `hospital_mgmt.sql` – database schema and table definitions  
- `sampleData.sql` – sample inserts for testing  
- Screenshots (optional)

## Tech Stack
- **SQL**
- **Relational database modeling**

## Example Queries
```sql
SELECT p.name, a.date, d.department_name 
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN departments d ON a.department_id = d.department_id;

## What Could Be Improved
- **Add stored procedures and triggers** to automate workflows (e.g., updating billing totals when a prescription is added).
- **Implement role-based views** (admin, doctor, billing officer) for more realistic, secure database access control.
