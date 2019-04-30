class InvoiceItem < ApplicationRecord
  belongs_to :invoices
  belongs_to :items
end
