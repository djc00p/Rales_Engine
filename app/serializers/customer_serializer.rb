class CustomerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :frist_name, :last_name, :created_at, :updated_at
end
