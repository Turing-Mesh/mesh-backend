# Mesh API Contract

## Endpoints

| HTTP verbs | Paths  | Used for | Output |
| ---------- | ------ | -------- | ------:|
| GET | /api/v1/students/:student_id/modules/:id | Get all of the project feedback for single student for a single module | [json](#students-modules) |
| PATCH | /api/v1/students/:student_id/modules/:module_id/projects/:id | Update student's project with personal comments | [json](#students-update-project) |
| GET | /api/v1/instructors/:instructor_id/modules/:id | Get all of the student names and ids for instructor's current module | [json](#instructor-module-students) |
| POST | /api/v1/instructors/:instructor_id/modules/search | Search for a single student's project information | [json](#instructor-students-search) |
| GET | /api/v1/instructors/:instructor_id/modules/:module_id | Get the list of students for instructor's current module | [json](#instructor-module-students) |
| POST | /api/v1/users | Registration new user  | [json](#user-registration) |
| POST | /api/v1/sessions | Login a user | [json](#sessions-create) |
