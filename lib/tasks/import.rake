namespace :import do
  desc "Import Customers from CSV file"

  task customer: :environment do
    require 'csv'
    count = 0
    CSV.foreach('./db/data/customers.csv', headers: true) do |row|
      Customer.create(row.to_h)
      count += 1
    end
    puts "Imported #{count} Customers"
  end

  desc "Import Invoice Items from CSV file"

  task invoice_item: :environment do
    require 'csv'
    count = 0
    CSV.foreach('./db/data/invoice_items.csv', headers: true) do |row|
      InvoiceItem.create(row.to_h)
      count += 1
    end
    puts "Imported #{count} Invoice Items"
  end

  desc "Import Invoices from CSV file"

  task invoice: :environment do
    require 'csv'
    count = 0
    CSV.foreach('./db/data/invoices.csv', headers: true) do |row|
      Invoice.create(row.to_h)
      count += 1
    end
    puts "Imported #{count} Invoice"
  end

  desc "Import Items from CSV file"

  task item: :environment do
    require 'csv'
    count = 0
    CSV.foreach('./db/data/items.csv', headers: true) do |row|
      Item.create(row.to_h)
      count += 1
    end
    puts "Imported #{count} Items"
  end

  desc "Import Merchants from CSV file"

  task merchant: :environment do
    require 'csv'
    count = 0
    CSV.foreach('./db/data/merchants.csv', headers: true) do |row|
      Merchant.create(row.to_h)
      count += 1
    end
    puts "Imported #{count} Merchants"
  end

  desc "Import Transactions from CSV file"

  task transaction: :environment do
    require 'csv'
    count = 0
    CSV.foreach('./db/data/transactions.csv', headers: true) do |row|
      Transaction.create!(row.to_h)
      count += 1
    end
    puts "Imported #{count} Transactions"
  end

  task :all => [:customer, :merchant, :invoice, :item, :transaction, :invoice_item]
end
