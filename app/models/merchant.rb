class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  validates_presence_of :name

  def self.most_revenue(count)
    select('merchant.*, SUM(invoice_items.quantity * invoice_items.unit_price)')
    .joins(items: :invoice_items)
    .group(:id)
    .order('revenue DESC')
    .limit(count)
  end
end
