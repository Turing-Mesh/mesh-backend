# Welcome to Mesh!

![](https://imgur.com/AoGl9AO.png)
<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#endpoints">Endpoints</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
  </ol>
</details>

### About The Project
## Background and Description
Mesh is the capstone project for the Turing School of Software and Design. A platform to standardize and organize feedback for programming schools and bootcamps alike. Students are able to easily retrieve and reflect upon past feedback to better improve for the future! 
## Learning Goals
- Work with a Full Stack team to integrate and learn each others workflow and framework
- Learn and work with new frameworks or languages
- Use a professional workflow to reflect industry standards
### Built With

* [Ruby on Rails](https://rubyonrails.org)


## Database Design Document
![Database Design Document](https://imgur.com/QTy9zsE.png)


<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* ruby
  ```sh
  rbenv install 2.5.3
  ```
* rails
  ```sh
  gem install rails --version 5.2.5
  ```
* postgreSQL
  ```sh
  install link: https://www.postgresql.org/download/
  ```

### Installation

1. Clone the repo
   ```sh
   git clone git@github.com:Turing-Mesh/mesh-backend.git
   ```
2. Bundle Install
   ```sh
   bundle install
   ```
3. (Optional Heroku deployment)
   ```sh
   heroku install guide: https://devcenter.heroku.com/articles/git
   ```

<!-- ENDPOINTS -->
### Endpoints
> For more details please see our [API Contract](API_contract.md)

| HTTP verbs | Paths  | Used for | Output |
| ---------- | ------ | -------- | ------:|
| GET | /api/v1/students/:student_id/student_projects?mod=1 | Get all of the project feedback for single student and a single mod | [json](#student-projects-by-mod) |
| PATCH | /api/v1/students/:student_id/student_projects/:id | Update student's project with personal comments | [json](#students-update-project) |
| GET | /api/v1/instructors/:instructor_id/instructor_students?mod=1 | Get all of the student names and ids for instructor's current mod | [json](#instructor-module-students) |
| POST | /api/v1/instructors/:instructor_id/instructor_students/search | Search for a single student's project information, response is same as students-project-by-mod (we need first and last name to search by in post body request)| [json](#instructor-students-search) |
| POST | /api/v1/users | Registration new user  | [json](#user-registration) |
| POST | /api/v1/sessions | Login a user | [json](#sessions-create) |
| ERROR | errors | Error handling for requests | [json](#error-handling) |

<!-- USAGE EXAMPLES -->
## Usage
1. Create rails database and migrate

```sh
$ rails db:create
$ rails db:migrate
```
3. Seed database
```sh
$ rails db:seed
```

2. Start server

```sh
$ rails s
```

4. Nagivate to `http://localhost:3000/`

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/Turing-Mesh/mesh-backend/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request




