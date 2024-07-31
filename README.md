# Student App

## Overview
The Student App is designed for students to access their academic information and class routine. The app features two main functionalities: viewing student details and attendance information, and checking the class routine by department and semester. The app is developed using the Flutter framework and is available on Android.

## Features

### Main Tabs
 The student sees two card view tabs:

1. **Student**
2. **Routine**

### Student Tab
When the student clicks the Student card view, they can:
- **Enter Student ID:** Input their student ID and search.
- **View Details:** See their name, semester, class roll, department name, and student ID.
- **Select Subject:** Use a dropdown menu to select a subject and view attendance details.
    - **Attendance Details:** View subject name, classes attended, total classes, and max attendance.
    - **Attendance Chart:** Click the subject card view to see a bar chart with attendance parameters:
        - **Total Classes:** Represented by blue color.
        - **Total Classes Attended:** Represented by non-dark green color.
        - **Max Attendance:** Represented by dark green color.

### Routine Tab
When the student clicks the Routine card view, they can:
- **View Routine:** Select their department and semester to view the class routine.

## User Interface
### Main Interface
- **Card View Tabs:**
    - **Student:** Access student details and attendance information.
    - **Routine:** Access class routine by department and semester selection.

### Student Tab Interface
- **Search Student:**
    - Field: Student ID
    - Search button to retrieve details.
- **Student Details:**
    - Displayed Information: Name, Semester, Class Roll, Department Name, Student ID.
- **Select Subject:**
    - Dropdown menu to select a subject.
    - Attendance Details: Subject name, classes attended, total classes, max attendance.
    - **Attendance Chart:**
        - Click the subject card view to display a bar chart.
        - Bar Chart Colors:
            - Total Classes: Blue
            - Total Classes Attended: Non-dark green
            - Max Attendance: Dark green

### Routine Tab Interface
- **View Routine:**
    - Selection Fields: Department, Semester
    - Display routine based on selections.

## Technology Stack
- **Framework:** Flutter
- **Platform:** Currently available for Android

## Functionality
1. **Student Details:**
    - Student enters their ID and retrieves their details.
    - Select a subject to view corresponding attendance details.
    - View a bar chart representing attendance parameters.

2. **Class Routine:**
    - Select department and semester to view the class routine.

## Conclusion
The Student App provides a user-friendly interface for students to access their academic details and class routine. With features to view personal details, attendance information, and class routines, students can easily stay informed about their academic progress and schedule. Built with Flutter, the app is currently available for Android users.
