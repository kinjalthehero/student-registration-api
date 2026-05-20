# Student Registration API

A RESTful API for student registration built with Java and Jersey (JAX-RS). Supports full CRUD operations and auto-generates university email addresses for new students.

## Features

- **CRUD Operations** — Create, read, update, and delete students via REST endpoints
- **Auto-Generated Email** — New students receive an email in the format `firstname.lastname@department.northeastern.edu`
- **Random Password** — Each generated email comes with a secure random password
- **In-Memory Storage** — Uses a HashMap as a lightweight in-memory database

## API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/students` | List all students |
| `GET` | `/students/{id}` | Get a student by ID |
| `POST` | `/students` | Register a new student |
| `PUT` | `/students/{id}` | Update a student |
| `DELETE` | `/students/{id}` | Delete a student |

## Request/Response Example

**POST** `/students`
```json
{
  "firstName": "Kinjal",
  "lastName": "Mistry",
  "address": "Boston, MA",
  "enrolledDepartment": "cs"
}
```

**Response:**
```json
{
  "studentId": 1,
  "firstName": "Kinjal",
  "lastName": "Mistry",
  "address": "Boston, MA",
  "enrolledDepartment": "cs",
  "email": {
    "emailAddress": "kinjal.mistry@cs.northeastern.edu",
    "password": "aB3x-_9k"
  },
  "created": "2019-01-26"
}
```

## Tech Stack

- **Java 7**
- **Jersey 2.27** (JAX-RS reference implementation)
- **Maven** for build management
- **WAR** packaging for servlet container deployment

## Project Structure

```
src/main/java/org/kinjal/project/studentregistration/
├── database/       DatabaseClass — in-memory HashMap store
├── model/          Student, Email — data models
├── resources/      StudentsResource — REST endpoints
└── service/        StudentService, EmailService — business logic
```

## How to Run

1. Build with Maven: `mvn clean package`
2. Deploy the generated WAR file to a servlet container (e.g., Tomcat, GlassFish)
3. Access the API at `http://localhost:8080/studentregistration/students`

## Author

Kinjal Mistry
