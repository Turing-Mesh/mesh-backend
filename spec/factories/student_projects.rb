FactoryBot.define do
  factory :student_project do
    instructor_comments { "This is a really good comment" }
    student_comments { "My student comment is better" }
    user
    project_template
  end
end
