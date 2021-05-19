# Mesh API Contract

## Endpoints

| HTTP verbs | Paths  | Used for | Output |
| ---------- | ------ | -------- | ------:|
| GET | /api/v1/students/:student_id/student_projects?mod=1 | Get all of the project feedback for single student and a single mod | [json](#student-projects-by-mod) |
| PATCH | /api/v1/students/:student_id/student_projects/:id | Update student's project with personal comments | [json](#students-update-project) |
| GET | /api/v1/instructors/:instructor_id/instructor_students/:student_id/project_templates?mod=1&project_number=2 | Get a mod project template and rubric categories | [json](#student-project-rubric-categories) |
| GET | /api/v1/instructors/:instructor_id/instructor_students?mod=1 | Get all of the student names and ids for instructor's current mod | [json](#instructor-module-students) |
| POST | /api/v1/instructors/:instructor_id/instructor_students/search | Search for a single student's project information, response is same as students-project-by-mod (we need first and last name to search by in post body request)| [json](#instructor-students-search) |
| POST | /api/v1/student_projects | Create student_project and related project_feedback records | [json](#instructor-create-project-feedback) |
| POST | /api/v1/users | Registration new user  | [json](#user-registration) |
| POST | /api/v1/sessions | Login a user | [json](#sessions-create) |
| ERROR | errors | Error handling for requests | [json](#error-handling) |

## JSON Responses

### Student Project Rubric Categories
`GET /api/v1/instructors/:instructor_id/instructor_students/:student_id/project_templates?mod=1&project_number=2`

The request returns a list of the rubric categories for a given student's mod project.
* __Required__

  The following query parameters are required. If any required fields are missing or include invalid data an error will be returned (see [error handling](#error-handling)).
  * mod = integer
  * project_number = integer

  Example json request body
  ```json
  {
    "student_id": 71,
    "project_template_id": 99,
    "mod": 1,
    "project_number": 2,
    "rubric_template": [
      {
        "rubric_category_template_id": 1,
        "rubric_category_name": "ActiveRecord"
      },
      {
        "rubric_category_template_id": 2,
        "rubric_category_name": "Rails"
      },
      {
        "rubric_category_template_id": 3,
        "rubric_category_name": "Feature Completeness"
      },
      {
        "rubric_category_template_id": 4,
        "rubric_category_name": "Testing"
      }
    ]
  }
  ```

### Student Projects By Mod
`GET /api/v1/students/:student_id/student_projects?mod=1`

The request provides the projects for a valid matching student id and mod (sent as a query parameter).
* __Required__
  * Mod query parameter must be included and have an integer value between 0-4. If the mod query parameter is missing, or is an invalid value an error is sent (see [error handling](#error-handling)).
* Data is returned in ascending order by project number.
* When no projects exist for that student and mod, there is still a json response with the student_projects and project_feedback as nil.

  Example json response with projects

  `GET /api/v1/students/1/student_projects?mod=1`
  ```json
  {
    "data": {
      "id": "1",
      "type": "projects",
      "attributes": {
        "mod": "1",
        "student_projects": [
          {
            "id": "109",
            "name": "war or peace",
            "program": "BE",
            "project_number": "1",
            "project_type": "solo",
            "is_final_project": false,
            "average_score": 2.75,
            "instructor_comments": "Some real good stuff.",
            "student_comments": "My personal notes.",
            "project_feedback": [
              {
                "id": "1",
                "rubric_category_name": "Code Quality",
                "score": 2.5,
                "comment": "Overall good work. I suggest researching enums more."
              },
              {
                "id": "2",
                "rubric_category_name": "Completion",
                "score": 3.0,
                "comment": null
              },
              {
                "id": "3",
                "rubric_category_name": "Testing",
                "score": 2.5,
                "comment": "Ensure you are testing for all scenarios."
              },
              {
                "id": "4",
                "rubric_category_name": "OOP Principles",
                "score": 3.0,
                "comment": null
              }
            ]
          },
          {
            "id": "201",
            "name": "battleship",
            "program": "BE",
            "project_number": "2",
            "project_type": "paired",
            "is_final_project": false,
            "average_score": 3.25,
            "instructor_comments": "Some real awesome stuff.",
            "student_comments": null,
            "project_feedback": [
              {
                "id": "101",
                "rubric_category_name": "Code Quality",
                "score": 3.5,
                "comment": "Great use of best enums."
              },
              {
                "id": "102",
                "rubric_category_name": "Completion",
                "score": 3.0,
                "comment": null
              },
              {
                "id": "103",
                "rubric_category_name": "Testing",
                "score": 3.5,
                "comment": null
              },
              {
                "id": "104",
                "rubric_category_name": "OOP Principles",
                "score": 3.0,
                "comment": null
              }
            ]
          }
        ]
      }
    }
  }
  ```
  Example json response without projects

  `GET /api/v1/students/1/student_projects?mod=2`
  ```json
  {
    "data": {
      "id": "1",
      "type": "projects",
      "attributes": {
        "mod": "2",
        "student_projects": null,
        "project_feedback": null
      }
    }
  }
  ```

### Instructor Students
`GET /api/v1/instructor/:instructor_id/instructor_students?mod=x`

The request provides the student's (name and id) for a given instructor who teaches a given module
* __Required__
 * Mod query parameter must be included and have an integer value between 0-4. If the mod query parameter is missing, or is an invalid value an error is sent (see [error handling](#error-handling)).
 * Data is returned in ascending order by user_id.
 * Students are only returned when they lie within the given module request

 Example json response with projects

  `GET /api/v1/instructor/1/instructor_students?mod=2`

  ```json
 {
   "data": [
    {
      "id": "215",
      "type": "student",
      "attributes": {
        "user_id": 262,
        "first_name": "Mike",
        "last_name": "Dach",
        "current_cohort": "2011"
        }
    },
    {
      "id": "216",
      "type": "student",
      "attributes": {
        "user_id": 263,
        "first_name": "Sharonda",
        "last_name": "Schimmel",
        "current_cohort": "2011"
        }
      }
    ]
  }
  ```
### Update Student Project Comments
`PATCH /api/v1/students/:student_id/student_projects/:id`

The request updates the student project record with personal student comments that are new, updated or removed. If the student id or project id in the route are missing, or invalid, an error will be returned (see [error handling](#error-handling)).
* __Required__

  The following field is required in the post body request. If any required fields are missing or include invalid data an error will be returned (see [error handling](#error-handling)).

  * student_comments = string

__** If existing student comments are removed please send an empty string.__

  Example json request body
  ```json
  {
    "student_comments": "Me-Mow ate my homework. I swear!"
  }
  ```

The response is the same as the [Student Projects By Mod](#student-projects-by-mod).

### Instructor Create Project Feedback
`POST /api/v1/student_projects`


The request creates a student project record and related project feedback records for a valid matching instructor id, student id and project template id.
* __Required__

  The following fields are required in the post body request. If any required fields are missing or include invalid data an error will be returned (see [error handling](#error-handling)).
  * instructor_id = integer
  * student_id = integer
  * project_template_id = integer
  * rubric_template_category_id = integer
  * score = float

  Example json request body
  ```json
  {
    "instructor_id": 10,
    "student_id": 201,
    "project_template_id": 16,
    "instructor_comments": "Some real good stuff.",
    "project_feedback": [
      {
        "rubric_template_category_id": 3,
        "score": 4.0,
        "comment": "Your awesomeness is shining through! It's so bright I need some shades."
      },
      {
        "rubric_template_category_id": 4,
        "score": 3.0,
        "comment": null
      },
      {
        "rubric_template_category_id": 5,
        "score": 2.5,
        "comment": null
      },
      {
        "rubric_template_category_id": 6,
        "score": 3.0,
        "comment": null
      }
    ]
  }
  ```

The response is the same as the [Student Projects By Mod](#student-projects-by-mod).

## Error Handling

### Sad Path Response (no data matches query)
* A sad path response is returned when no matching data can be found, such as when the student search returns 0 results.

  ```json
    {
      "data": {}
    }
  ```

### Edge Case Response (invalid data parameters)
* An edge case error is returned when invalid data parameters are provided, such as invalid student/instructor id, missing parameters, or invalid data for a parameter (i.e. empty string, blank, letter instead of integer, etc.).

  ```json
  {
    "error": "error message"
  }
  ```
