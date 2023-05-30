FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test.user.#{n}@example.com" }
    password { 'very-strong_password+123' }
  end
end
