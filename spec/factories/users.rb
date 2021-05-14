FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password_digest { Faker::Internet.password }
    role { Faker::Number.between(from: 0, to: 1) }
    active { true }
  end
end
