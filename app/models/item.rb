class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :unit_price

  def self.unit_price_find(price)
    converted_price = price.delete(".").to_i
    where(unit_price: converted_price)
  end

  def find_merchant(item_params)
    where(item_params).order("id ASC")
  end


  def self.most_revenue(count)
    select('items.*, SUM(invoice_items.quantity * invoice_items.unit_price) as revenue')
    .joins(:invoice_items)
    .group(:id)
    .order('revenue DESC')
    .limit(count)
  end

  def self.most_items(count)
    select('items.*, SUM(invoice_items.quantity) as items_sold')
    .joins(:invoice_items)
    .group(:id)
    .order('items_sold DESC')
    .limit(count)
  end

  def best_day(item_id)
    Item.where(id: 1099)
        .select('items.*, SUM(invoice_items.quantity) as items_sold')
        .joins(invoice_items: :invoice)
        .group(:id)
        .group("invoices.created_at")
        .order('invoices.created_at DESC').first.created_at
  end
end
