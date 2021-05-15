FactoryBot.define do
  factory :project_template do
    rubric_template { nil }
    name { "MyString" }
    mod { "MyString" }
    program { "MyString" }
    project_number { "MyString" }
    type { 1 }
    is_final { false }
  end
end
