FactoryBot.define do
  factory :vendor do
    code { Faker::Name.unique.name }
    name { Faker::Name.name }
    vendor_type { "general" }
  end 
end 