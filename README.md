# PL/SQL and SQL Group Assignment

This repository hosts a PostgreSQL database assessment. The core of this project is the `pl_and_sql_group_assignment.sql` file, which is a comprehensive SQL script designed to create, populate, and query a simple student enrollment database.

## Project Structure

* `pl_and_sql_group_assignment.sql`: The main SQL file.
* `README.md`: This file, providing an overview of the project.

## Database Schema

The database consists of three main tables:

* **`students`**: Stores student information (student_id, first_name, last_name, email).
* **`courses`**: Stores course details (course_id, course_name, credits).
* **`enrollments`**: Links students to courses (enrollment_id, student_id, course_id, enrollment_date).

## Key Features

This assessment demonstrates proficiency in several key areas of SQL and database management:

* **Schema Design**: Creating tables with proper data types and constraints.
* **Data Manipulation**: Inserting data into tables.
* **Views and Indexes**: Using views to simplify complex queries and indexes to optimize performance.
* **Advanced Queries**: Utilizing various `JOIN` operations to retrieve combined data from multiple tables.

## How to Use

To set up this database locally and run the queries, you can use a PostgreSQL client (like `psql` or a graphical tool like DBeaver) and execute the entire `pl_and_sql_group_assignment.sql` script.

Alternatively, you can manually run the sections to create the tables, insert the data, and then run the example queries.
