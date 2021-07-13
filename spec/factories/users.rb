FactoryBot.define do
  factory :user do
    name  "tester"
    sequence(:email) { |n| "tester#{n}@example.com" }
    password              "tester"
    password_confirmation "tester"
  end
end
