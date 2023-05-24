FactoryBot.define do
  factory :doctor do
    first_name { "John" }
    last_name { "Doe" }
    phone { "1234567890" }
    association :doctor_category, factory: :doctor_category
    password { "123456" }
  end
end
