class MerchantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name

  attribute :revenue do |object|
    revenue = object.find_revenue(object.id)
    total_revenue = (revenue * 0.01).round(2).to_s
    total_revenue
  end
  # attribute :total_revenue do |object|
  #   binding.pry
  #   revenue = object.total_revenue_by_date(object.date, object.id)
  #   total_revenue = (revenue * 0.01).round(2).to_s
  #   total_revenue
  # end
end
