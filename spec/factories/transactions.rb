FactoryBot.define do
  factory :transaction do
    credit_card_number { "9358827631846591" }
    credit_card_expiration_date { "04/22" }
    result { "success" }
  end
end
