# Student Management System

An OOP-based Student Management System built using Python. This project converts a functional student management application into an Object-Oriented Programming (OOP) application.

## Features

* Add student
* View all students
* Search student by name
* Update student details
* Delete student
* View individual student details
* Add courses
* Enroll students in courses
* Add teachers
* Assign teachers to courses
* Display department, courses, teachers, and enrolled students
* Input validation and error handling

## OOP Classes

The application is divided into the following classes:

### 1. Student

Represents a student in the system.

Stores:

* Student ID
* Name
* Age

### 2. Course

Represents a course.

Stores:

* Course name
* Enrolled students
* Assigned teacher

### 3. Department

Represents an academic department.

Stores:

* Department name
* List of courses

### 4. Teacher

Represents a teacher who can be assigned to a course.

Stores:

* Teacher ID
* Name
* Subject

### 5. StudentManagementSystem

Handles the main application operations such as adding, searching, updating, deleting, enrolling, and displaying records.

## Relationships

The main relationship implemented in the application is:

```text
Department
    ↓
  Course
    ↓
 Student
```

A department can contain multiple courses, and each course can contain multiple students.

Teachers can also be assigned to courses:

```text
Department
    ↓
  Course ← Teacher
    ↓
 Student
```

## Example

```text
Computer Science Department
        |
        +── Python
        |     |
        |     +── Rohit
        |     +── Rahul
        |
        +── SQL
              |
              +── Rohit
              +── Aman
```

## OOP Concepts Used

### Classes and Objects

Classes are used as blueprints for `Student`, `Course`, `Department`, `Teacher`, and `StudentManagementSystem`.

Objects are created from these classes.

```python
student = Student(101, "Rohit", 21)

course = Course("Python")

department = Department("Computer Science")
```

### Object Relationships

Objects are stored inside other objects to create relationships.

For example:

```python
course.add_student(student)

department.add_course(course)
```

This creates the:

```text
Department → Course → Student
```

relationship.

### Methods

Each class contains methods for performing operations related to its objects.

Examples:

```python
add_student()
remove_student()
add_course()
assign_teacher()
display()
```

## Input Validation

The application validates user input to prevent invalid data.

* Duplicate student IDs are rejected.
* Empty names are rejected.
* Invalid ages are rejected.
* Invalid numeric input is handled using `try-except`.
* Students cannot be enrolled in the same course twice.
* Non-existing students, courses, and teachers are handled properly.

## Menu

The application provides the following menu:

```text
--- Student Management System ---

1. Add Student
2. View Students
3. Search Student
4. Update Student
5. Delete Student
6. Student Details
7. Add Course
8. Enroll Student
9. Add Teacher
10. Assign Teacher
11. Display Department
12. Exit
```

## How to Run

Make sure Python is installed.

Run the program from the terminal:

```bash
python student_app.py
```

On Linux/macOS:

```bash
python3 student_app.py
```

## Project Structure

```text
Day 7/
│
├── student_app.py
└── README.md
```

## Learning Objective

The purpose of this practical task is to convert a functional Python application into an OOP-based application using classes, objects, methods, and relationships between objects.

The primary relationship implemented is:

```text
Department
    ↓
  Course
    ↓
 Student
```

The project also demonstrates input validation, exception handling, and object-oriented application design.
