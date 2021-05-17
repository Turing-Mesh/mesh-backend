FactoryBot.define do
  factory :student_project do
    instructor_comments { "This is a really good comment" }
    student_comments { "My student comment is better" }
    student_id {nil}
    project_template_id {nil}
  end
end
