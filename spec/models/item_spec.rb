require 'rails_helper'

RSpec.describe Item, type: :model do
  it {should belong_to :merchant}
  it {should validate_presence_of :name}
  it {should validate_presence_of :description}
  it {should validate_numericality_of :unit_price}
  it {should have_many :invoice_items}
  it {should have_many(:invoices).through(:invoice_items)}
end
