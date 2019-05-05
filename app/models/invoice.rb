class Invoice < ApplicationRecord
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  belongs_to :customer
  belongs_to :merchant
  validates_presence_of :status

  scope :date_desc, -> { order('created_at DESC') }

  def self.revenue(merchant,date)
    where(updated_at: date)
    .where(merchant_id: merchant)
    .select("invoinces.*, SUM(invoice_items.quantity * invoice_items.unit_price) as revenue, SUM(SELECT(revenue)) as total_revenue")
    .joins(invoice: :invoice_items)
    .group(:id)
  end
end
