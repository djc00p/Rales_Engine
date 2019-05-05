class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name
  has_many :invoices

  def self.favorite_merchant(customer_id)
    Merchant.select("merchants.*, COUNT(transactions.result) as count")
            .joins(invoices: :transactions)
            .merge(Transaction.successful)
            .group(:id)
            .order("count DESC")
            .where(invoices: {customer_id: customer_id})
            .limit(1)
  end
end
