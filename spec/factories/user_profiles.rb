FactoryBot.define do
  factory :user_profile do
    user_id {nil}
    first_name { Faker::Name.first_name  }
    last_name { Faker::Name.last_name }
    current_mod { "#{Faker::Number.between(from: 1, to: 4)}" }
    program { "BE" }
    starting_cohort { nil }
    current_cohort { nil }
    status { nil }
  end
end
