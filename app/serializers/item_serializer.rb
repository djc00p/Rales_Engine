class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :unit_price, :created_at, :updated_at, :mercahnt_id
end
