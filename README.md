# Student Registration API

**Live API: [https://student-registration-api-inrq.onrender.com/students](https://student-registration-api-inrq.onrender.com/students)**

A RESTful API for student registration built with Java and Jersey (JAX-RS). Supports full CRUD operations and auto-generates university email addresses for new students.

> The first request may take ~30 seconds if the server is waking up — it's hosted on a free tier that sleeps after inactivity.

---

## Try It Out

No setup needed — click the links below to try the live API right in your browser.

### 1. View all registered students
Open this link in your browser:
```
https://student-registration-api-inrq.onrender.com/students
```

### 2. Register a new student
Copy and paste this into your terminal (Mac/Linux) or use an API tool like [Reqbin](https://reqbin.com):

```bash
curl -X POST https://student-registration-api-inrq.onrender.com/students \
  -H "Content-Type: application/json" \
  -d '{
    "firstName": "Jane",
    "lastName": "Doe",
    "address": "Boston, MA",
    "enrolledDepartment": "cs"
  }'
```

The API will automatically generate a university email (`jane.doe@cs.northeastern.edu`) and a random password.

### 3. View, update, or delete a student
```bash
# Get student by ID
curl https://student-registration-api-inrq.onrender.com/students/1

# Update a student
curl -X PUT https://student-registration-api-inrq.onrender.com/students/1 \
  -H "Content-Type: application/json" \
  -d '{"firstName": "Jane", "lastName": "Smith", "address": "New York, NY", "enrolledDepartment": "math"}'

# Delete a student
curl -X DELETE https://student-registration-api-inrq.onrender.com/students/1
```

---

## Features

- **CRUD Operations** — Create, read, update, and delete students via REST endpoints
- **Auto-Generated Email** — New students receive an email in the format `firstname.lastname@department.northeastern.edu`
- **Random Password** — Each generated email comes with a secure random password
- **In-Memory Storage** — Uses a HashMap as a lightweight in-memory database
- **Dockerized** — Single-command deployment with Docker
- **Live on Render** — Free cloud hosting with auto-deploy from GitHub

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
- **Docker** + **Tomcat 9** for containerized deployment
- **Render** for free cloud hosting

## Project Structure

```
src/main/java/org/kinjal/project/studentregistration/
├── database/       DatabaseClass — in-memory HashMap store
├── model/          Student, Email — data models
├── resources/      StudentsResource — REST endpoints
└── service/        StudentService, EmailService — business logic
```

## Run Locally

### Using Docker
```bash
docker build -t student-registration-api .
docker run -p 8080:8080 student-registration-api
```

### Using Maven
```bash
mvn clean package
# Deploy target/studentregistration.war to Tomcat or GlassFish
```

Access the API at `http://localhost:8080/students`

## Author

Kinjal Mistry
