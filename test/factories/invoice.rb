FactoryBot.define do
  factory :invoice do
    invoice_number { rand(1..100) }
    document_number {rand(1..100)}
    document_type {random = ['RE','RT','KG','KD','ZA'].sample}
    due_date {Date.today}
    document_date {Date.today}
    posting_date {Date.today}
    amount {Faker::Number.number}
    association :vendor
  end 
end 