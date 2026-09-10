# Student Management CLI Application

## Description

The Student Management CLI Application is a Python-based command-line application used to manage student records.

The application allows users to add, view, search, update, delete, and display student details.

## Features

- Add student
- View students
- Search student
- Update student
- Delete student
- Display student details
- Input validation
- Exception handling

## Technologies Used

- Python
- Lists
- Dictionaries
- Functions
- Exception Handling

## Project Structure
Day 6/
│
├── student_app.py
│   └── Main Python source code for the Student Management CLI Application
│
├── README.md
│   └── Project documentation, features, setup, and usage instructions
│
├── day6.pdf
│   └── Day 6 task/documentation
│
└── screenshots/
    └── Application screenshots and terminal outputs

## How to Run

# 1. Clone the repository
git clone <repository-url>

# 2. Navigate to the project folder
cd "Day 6"

# 3. Check Python version
python --version

# 4. Run the application
python student_app.py

## Data Structure

Student records are stored using a list of dictionaries.

Example:

students = [
    {
        "id": 101,
        "name": "Rohit",
        "age": 21,
        "course": "Computer Science"
    }
]

## Functions

add_student() - Adds a new student.

view_students() - Displays all students.

search_student() - Searches for a student by name.

update_student() - Updates student information.

delete_student() - Deletes a student.

show_student() - Displays complete student details.

run_app() - Runs the main menu.

## Exception Handling

The program uses try-except blocks to handle invalid input such as entering text instead of a number.

## Conclusion

This project demonstrates basic Python programming concepts including functions, lists, dictionaries, loops, conditions, input validation, and exception handling.
