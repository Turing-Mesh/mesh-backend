FactoryBot.define do
  factory :project_feedback do
    user
    student_project
    rubric_template_category
    sequence :score do |n|
      n + 0.5
    end
  end
end
