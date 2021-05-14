FactoryBot.define do
  factory :rubric_category do
    sequence :name  do |n|
      "Category #{n + 1}"
    end
  end
end
