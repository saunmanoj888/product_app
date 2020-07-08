FactoryBot.define do
  factory :user do
    email { "John@example.com" }
    first_name { "John" }
    last_name  { "Doe" }
    password  { "JohnDoe" }
  end
end
