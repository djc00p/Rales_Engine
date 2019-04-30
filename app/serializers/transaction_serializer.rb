class TransactionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :invoice_id, :credit_card_number, :credit_card_experation_date, :created_at, :updated_at
end
