# Final Project – MySQL Database README

##  Project Overview

This project demonstrates SQL concepts including:

* Database & table creation (DDL)
* Data insertion, updates, deletion (DML)
* Joins, subqueries, aggregate functions
* Foreign key constraints
* Window functions
* Case expressions

Database Name: **Final_Project**

The project simulates a **university management system** with:

* Students
* Departments
* Courses
* Instructors
* Enrollments

---

##  Database Structure

### **1. Students Table**

Stores student personal and enrollment details.

### **2. Departments Table**

Stores department names.

### **3. Courses Table**

Contains course information and links to departments.

### **4. Instructors Table**

Contains instructor details and department associations.

### **5. Enrollments Table**

Maps students to courses with enrollment dates.

---

##  SQL Tasks

Below is a summary of all queries written in the project.

### **Q1 – CRUD Operations**

Performed SELECT, UPDATE, DELETE operations on all tables.

### **Q2 – Filter Students Based on Enrollment Date**

Retrieve students enrolled after a specific date.

### **Q3 – Subquery for Courses in Mathematics Department**

Uses subquery to fetch related data.

### **Q4 – Courses with More Than 5 Students**

Aggregation + HAVING.

### **Q5 – Students Enrolled in Both Course 101 and 102**

Uses two EXISTS subqueries.

### **Q6 – Students Enrolled in Either 101 or 102**

DISTINCT + JOIN + IN.

### **Q7 – Average Credits**

Uses AVG().

### **Q8 – Highest Instructor Salary in Computer Science**

Added Salary column, attempted insertion, used MAX().

### **Q9 – Number of Students in Each Department**

Joins + COUNT(DISTINCT).

### **Q10 – Student Enrollment Details (Inner Join)**

Shows each student's courses.

### **Q11 – Student Enrollment Details (Left Join)**

Shows all students even if not enrolled.

### **Q12 – Students Enrolled in Courses With >10 Students**

Subquery + HAVING.

### **Q13 – Extract Enrollment Year**

Uses YEAR() function.

### **Q14 – Instructor Full Name**

Using CONCAT().

### **Q15 – Cumulative Enrollments Over Time**

Window function: COUNT() OVER.

### **Q16 – Classifying Students (Senior/Junior)**

Uses CASE + DATEDIFF().

---

##  Notes & Fixes

* Some queries contain minor mistakes (e.g., typos, incorrect joins).
* Department name 'Computer science ' had a trailing space, causing mismatches.
* Insert into Instructors Salary failed because InstructorID and other fields were NOT provided.
* Joins like `s.StudentID = s.StudentID` should be `s.StudentID = e.StudentID`.

---

##  Suggested Improvements

* Use auto-increment primary keys.
* Use NOT NULL constraints.
* Normalize table structures.
* Avoid disabling `FOREIGN_KEY_CHECKS` unless required.

---

##  Project Completed Successfully

This README summarizes the full SQL project and all tasks performed.
