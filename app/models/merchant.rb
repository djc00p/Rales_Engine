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

  def self.total_revenue_by_date(date)
    Invoice.joins(:invoice_items, :transactions)
    .select("SUM(invoice_items.quantity * invoice_items.unit_price) as total_revenue")
    .merge(Transaction.successful)
    .group(:id)
    .where("invoices.created_at::timestamp::date = ?", date).first.total_revenue
  end

  def find_revenue(merchant)
    Merchant.where(id: merchant)
    .select('merchants.id, SUM(invoice_items.quantity * invoice_items.unit_price) as revenue')
    .joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.successful)
    .group(:id).first.revenue
  end

  def self.total_revenue_invoice_date(date, merchant)
    Invoice.joins(:invoice_items, :transactions)
      .select("SUM(invoice_items.quantity * invoice_items.unit_price) as total_revenue")
      .merge(Transaction.successful)
      .group(:id)
      .where("invoices.created_at::timestamp::date = ?", date)
      .where(merchant_id: merchant).first
  end

  def self.favorite_customer(merchant_id)
    Customer.select("customers.*, COUNT(transactions.result) as count")
            .joins(invoices: :transactions)
            .merge(Transaction.successful)
            .group(:id)
            .order("count DESC")
            .where(invoices: {merchant_id: merchant_id})
            .limit(1)
  end
end
