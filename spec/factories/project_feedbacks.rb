FactoryBot.define do
  factory :project_feedback do
    instructor_id {nil}
    project_id {nil}
    rubric_template_category_id {nil}
    comment {Faker::Movies::StarWars.quote}
    score { [2, 2.5, 3, 3.5, 4].sample }
  end
end
