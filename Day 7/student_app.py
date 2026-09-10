
# Represents a student in the system
class Student:

    def __init__(self, student_id, name, age):
        self.student_id = student_id
        self.name = name
        self.age = age

    def display(self):
        print("ID:", self.student_id)
        print("Name:", self.name)
        print("Age:", self.age)


# Represents a teacher who can be assigned to a course
class Teacher:

    def __init__(self, teacher_id, name, subject):
        self.teacher_id = teacher_id
        self.name = name
        self.subject = subject

    def display(self):
        print("Teacher ID:", self.teacher_id)
        print("Teacher Name:", self.name)
        print("Subject:", self.subject)


# A course contains enrolled students and an assigned teacher
class Course:

    def __init__(self, course_name):
        self.course_name = course_name
        self.students = []
        self.teacher = None

    def add_student(self, student):
        self.students.append(student)

    def remove_student(self, student):
        self.students.remove(student)

    def assign_teacher(self, teacher):
        self.teacher = teacher

    def display(self):

        print("\nCourse:", self.course_name)

        if self.teacher:
            print(
                "Teacher:",
                self.teacher.name
            )

        if len(self.students) == 0:
            print("No students enrolled.")
            return

        print("Students:")

        for student in self.students:
            print(
                student.student_id,
                "-",
                student.name
            )


# A department contains multiple courses
class Department:

    def __init__(self, department_name):
        self.department_name = department_name
        self.courses = []

    def add_course(self, course):
        self.courses.append(course)

    def display(self):

        print("\nDepartment:", self.department_name)

        if len(self.courses) == 0:
            print("No courses available.")
            return

        for course in self.courses:
            course.display()


# Handles all operations of the student management application
class StudentManagementSystem:

    def __init__(self):
        self.students = []
        self.departments = []
        self.teachers = []

    def add_student(self):

        try:
            sid = int(input("Enter student ID: "))

            # Prevent two students from having the same ID
            for student in self.students:

                if student.student_id == sid:
                    print("ID already exists.")
                    return

            name = input("Enter name: ").strip()

            if name == "":
                print("Name cannot be empty.")
                return

            age = int(input("Enter age: "))

            if age <= 0:
                print("Enter a valid age.")
                return

            student = Student(sid, name, age)

            self.students.append(student)

            print("Student added.")

        except ValueError:
            print("Please enter a valid number.")

    def view_students(self):

        if len(self.students) == 0:
            print("No students available.")
            return

        for student in self.students:

            print(
                "ID:", student.student_id,
                "| Name:", student.name,
                "| Age:", student.age
            )

    def search_student(self):

        name = input(
            "Enter name to search: "
        ).strip().lower()

        for student in self.students:

            if student.name.lower() == name:

                print("Student found:")

                student.display()

                return

        print("Student not found.")

    def update_student(self):

        try:

            sid = int(
                input("Enter student ID: ")
            )

            for student in self.students:

                if student.student_id == sid:

                    name = input(
                        "Enter new name: "
                    ).strip()

                    age = int(
                        input("Enter new age: ")
                    )

                    if name == "" or age <= 0:

                        print("Invalid details.")

                        return

                    student.name = name
                    student.age = age

                    print("Student updated.")

                    return

            print("Student not found.")

        except ValueError:

            print("Please enter a valid number.")

    def delete_student(self):

        try:

            sid = int(
                input("Enter student ID: ")
            )

            for student in self.students:

                if student.student_id == sid:

                    self.students.remove(student)

                    # Remove the student from any course they were enrolled in
                    for department in self.departments:

                        for course in department.courses:

                            if student in course.students:

                                course.remove_student(student)

                    print("Student deleted.")

                    return

            print("Student not found.")

        except ValueError:

            print("Please enter a valid number.")

    def show_student(self):

        try:

            sid = int(
                input("Enter student ID: ")
            )

            for student in self.students:

                if student.student_id == sid:

                    print("\nStudent Details")

                    student.display()

                    return

            print("Student not found.")

        except ValueError:

            print("Please enter a valid ID.")

    def add_course(self):

        course_name = input(
            "Enter course name: "
        ).strip()

        if course_name == "":
            print("Course name cannot be empty.")
            return

        course = Course(course_name)

        department_name = input(
            "Enter department name: "
        ).strip()

        # Add the course to an existing department if found
        for department in self.departments:

            if department.department_name.lower() == department_name.lower():

                department.add_course(course)

                print("Course added to department.")

                return

        # Create the department if it does not already exist
        department = Department(department_name)

        department.add_course(course)

        self.departments.append(department)

        print("Department and course added.")

    def enroll_student(self):

        try:

            sid = int(
                input("Enter student ID: ")
            )

            student = None

            # Find the student before enrolling them
            for s in self.students:

                if s.student_id == sid:
                    student = s
                    break

            if student is None:

                print("Student not found.")

                return

            course_name = input(
                "Enter course name: "
            ).strip()

            # Find the course inside the department structure
            for department in self.departments:

                for course in department.courses:

                    if course.course_name.lower() == course_name.lower():

                        if student in course.students:

                            print(
                                "Student already enrolled."
                            )

                            return

                        course.add_student(student)

                        print("Student enrolled.")

                        return

            print("Course not found.")

        except ValueError:

            print("Please enter a valid ID.")

    def add_teacher(self):

        try:

            teacher_id = int(
                input("Enter teacher ID: ")
            )

            name = input(
                "Enter teacher name: "
            ).strip()

            subject = input(
                "Enter subject: "
            ).strip()

            teacher = Teacher(
                teacher_id,
                name,
                subject
            )

            self.teachers.append(teacher)

            print("Teacher added.")

        except ValueError:

            print("Please enter a valid number.")

    def assign_teacher(self):

        try:

            teacher_id = int(
                input("Enter teacher ID: ")
            )

            teacher = None

            for t in self.teachers:

                if t.teacher_id == teacher_id:

                    teacher = t

                    break

            if teacher is None:

                print("Teacher not found.")

                return

            course_name = input(
                "Enter course name: "
            ).strip()

            for department in self.departments:

                for course in department.courses:

                    if course.course_name.lower() == course_name.lower():

                        course.assign_teacher(teacher)

                        print("Teacher assigned.")

                        return

            print("Course not found.")

        except ValueError:

            print("Please enter a valid ID.")

    def display_department(self):

        if len(self.departments) == 0:

            print("No departments available.")

            return

        for department in self.departments:

            department.display()

    def run(self):

        while True:

            print("\n--- Student Management System ---")

            print("1. Add Student")
            print("2. View Students")
            print("3. Search Student")
            print("4. Update Student")
            print("5. Delete Student")
            print("6. Student Details")
            print("7. Add Course")
            print("8. Enroll Student")
            print("9. Add Teacher")
            print("10. Assign Teacher")
            print("11. Display Department")
            print("12. Exit")

            try:

                choice = int(
                    input("Enter choice: ")
                )

                if choice == 1:
                    self.add_student()

                elif choice == 2:
                    self.view_students()

                elif choice == 3:
                    self.search_student()

                elif choice == 4:
                    self.update_student()

                elif choice == 5:
                    self.delete_student()

                elif choice == 6:
                    self.show_student()

                elif choice == 7:
                    self.add_course()

                elif choice == 8:
                    self.enroll_student()

                elif choice == 9:
                    self.add_teacher()

                elif choice == 10:
                    self.assign_teacher()

                elif choice == 11:
                    self.display_department()

                elif choice == 12:

                    print("Goodbye!")

                    break

                else:

                    print(
                        "Choose a number from 1 to 12."
                    )

            except ValueError:

                print("Please enter a number.")


# Create the application object and start the program
app = StudentManagementSystem()

app.run()
