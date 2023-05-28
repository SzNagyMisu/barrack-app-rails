FactoryBot.define do
  factory :training_session do
    trainer
    start_time { 1.day.from_now }
    price { 1000 }
  end
end
