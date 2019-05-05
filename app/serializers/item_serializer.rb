class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :unit_price, :merchant_id

  attribute :unit_price do |object|
    (object.unit_price * 0.01).round(2).to_s
  end

  attribute :best_day do |object|
    created_at_date = object.best_day(object.id)
    best_day = created_at_date.strftime('%Y-%m-%d')
    best_day
  end
end
