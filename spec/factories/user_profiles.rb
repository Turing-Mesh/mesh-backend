FactoryBot.define do
  factory :user_profile do
    user
    first_name { Faker::Name.first_name  }
    last_name { Faker::Name.last_name }
    current_mod { "#{Faker::Number.between(from: 1, to: 4)}" }
    program { "BE" }
    starting_cohort { "#{Faker::Number.number(digits: 4)}" }
    current_cohort { "#{Faker::Number.number(digits: 4)}" }
    status { Faker::Number.between(from: 0, to: 3) }
  end
end
