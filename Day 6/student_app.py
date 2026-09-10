
students = []


def add_student():
    try:
        sid = int(input("Enter student ID: "))

        for s in students:
            if s["id"] == sid:
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

        course = input("Enter course: ").strip()

        students.append({
            "id": sid,
            "name": name,
            "age": age,
            "course": course
        })

        print("Student added.")


    except ValueError:
        print("Please enter a valid number.")


def view_students():
    if len(students) == 0:
        print("No students available.")
        return

    for s in students:
        print(s)


def search_student():
    name = input("Enter name to search: ").strip().lower()

    for s in students:
        if s["name"].lower() == name:
            print("Student found:")
            print(s)
            return

    print("Student not found.")


def update_student():
    try:
        sid = int(input("Enter student ID: "))

        for s in students:
            if s["id"] == sid:
                name = input("Enter new name: ").strip()
                age = int(input("Enter new age: "))
                course = input("Enter new course: ").strip()

                if name == "" or age <= 0 or course == "":
                    print("Invalid details.")
                    return

                s["name"] = name
                s["age"] = age
                s["course"] = course

                print("Student updated.")
                return

        print("Student not found.")

    except ValueError:
        print("Please enter a valid number.")


def delete_student():
    try:
        sid = int(input("Enter student ID: "))

        for s in students:
            if s["id"] == sid:
                students.remove(s)
                print("Student deleted.")
                return

        print("Student not found.")

    except ValueError:
        print("Please enter a valid number.")


def show_student():
    try:
        sid = int(input("Enter student ID: "))

        for s in students:
            if s["id"] == sid:
                print("\nStudent Details")
                print("ID:", s["id"])
                print("Name:", s["name"])
                print("Age:", s["age"])
                print("Course:", s["course"])
                return

        print("Student not found.")

    except ValueError:
        print("Please enter a valid ID.")


def run_app():
    while True:
        print("\n--- Student Management System ---")
        print("1. Add Student")
        print("2. View Students")
        print("3. Search Student")
        print("4. Update Student")
        print("5. Delete Student")
        print("6. Student Details")
        print("7. Exit")

        try:
            choice = int(input("Enter choice: "))

            if choice == 1:
                add_student()
            elif choice == 2:
                view_students()
            elif choice == 3:
                search_student()
            elif choice == 4:
                update_student()
            elif choice == 5:
                delete_student()
            elif choice == 6:
                show_student()
            elif choice == 7:
                print("Goodbye!")
                break
            else:
                print("Choose a number from 1 to 7.")

        except ValueError:
            print("Please enter a number.")


run_app()

