FactoryBot.define do
  factory :transaction do
    sequence(:credit_card_number) { |n| "489#{n}098#{n}502938#{n}" }
    credit_card_expiration_date { "04/22" }
    result { "success" }
  end
end
