FactoryBot.define do
  factory :trainer do
    sequence(:name) { |n| "Test Trainer #{n}" }
  end
end
