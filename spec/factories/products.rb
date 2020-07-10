FactoryBot.define do
  factory :product do
    name { "Iphone" }
    model { "12" }
    brand  { "Apple" }
    released_date  { Date.today }
    ram  { 16 }
    external_storage  { 128 }
  end
end
