class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  validates_presence_of :name

  def self.most_revenue(count)
    select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) as revenue')
    .joins(items: :invoice_items)
    .group(:id)
    .order('revenue DESC')
    .limit(count)
  end

  def self.most_items(count)
    select('merchants.*, SUM(invoice_items.quantity) as items_sold')
    .joins(items: :invoice_items)
    .group(:id)
    .order('items_sold DESC')
    .limit(count)
  end

  def self.revenue(date)
    select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) as revenue')
    .joins(items: :invoice_items)
    .group(:id)
    .where(updated_at: date)
    .order('revenue DESC')
  end
end
