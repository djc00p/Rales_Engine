namespace :import do
  desc "Import Customers from CSV file"

  task customer: :environment do
    require 'csv'
    CSV.foreach('./db/data/customers.csv', headers: true) do |row|
      Customer.create(row.to_h)
    end
  end

  desc "Import Invoice Items from CSV file"

  task invoice_item: :environment do
    require 'csv'
    CSV.foreach('./db/data/invoice_items.csv', headers: true) do |row|
      InvoiceItem.create(row.to_h)
    end
  end

  desc "Import Invoices from CSV file"

  task invoice: :environment do
    require 'csv'
    CSV.foreach('./db/data/invoices.csv', headers: true) do |row|
      Invoice.create(row.to_h)
    end
  end

  desc "Import Items from CSV file"

  task item: :environment do
    require 'csv'
    CSV.foreach('./db/data/items.csv', headers: true) do |row|
      Item.create(row.to_h)
    end
  end

  desc "Import Merchants from CSV file"

  task merchant: :environment do
    require 'csv'
    CSV.foreach('./db/data/merchants.csv', headers: true) do |row|
      Merchant.create(row.to_h)
    end
  end

  desc "Import Transactions from CSV file"

  task transaction: :environment do
    require 'csv'
    CSV.foreach('./db/data/transactions.csv', headers: true) do |row|
      Transaction.create(row.to_h)
    end
  end
end
