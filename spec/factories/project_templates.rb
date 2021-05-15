FactoryBot.define do
  factory :project_template do
    rubric_template
    sequence :name do |n|
      "Awesome Project #{n + 1}"
    end
    mod { "#{Faker::Number.between(from: 1, to: 4)}" }
    program { "BE" }
    project_number { "#{Faker::Number.between(from: 1, to: 4)}" }
    project_type { Faker::Number.between(from: 0, to: 2) }
    is_final { false }
  end
end
