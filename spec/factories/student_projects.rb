FactoryBot.define do
  factory :student_project do
    sequence :name do |n|
      "Awesome Project #{n + 1}"
    end
    sequence :mod  do |n|
      "#{n + 1}"
    end
    program { "BE" }
    instructor_comments { "This is a really good comment" }
    student_comments { "My student comment is better" }
    user
  end
end
