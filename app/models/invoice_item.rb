class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item
  validates_presence_of :quantity, :unit_price

  def self.unit_price_find(price)
    converted_price = price.delete(".").to_i
    where(unit_price: converted_price)
  end
end
