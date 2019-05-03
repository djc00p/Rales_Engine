FactoryBot.define do
  factory :invoice_item do
    invoice
    item
    sequence(:quantity) { |n| ("#{n}".to_i+2) * 2 }
    sequence(:unit_price) { |n| ("#{n}".to_i+10) * 1.5 }
  end
end
