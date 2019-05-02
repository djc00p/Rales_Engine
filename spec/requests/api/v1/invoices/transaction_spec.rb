require 'rails_helper'

describe "Invoice API" do
  it "sends a list of invoice transaction" do
    merch = create(:merchant)
    customer1, customer2, customer3, customer4 = create_list(:customer, 4)
    id = create(:invoice, customer_id: customer3.id, merchant_id: merch.id).id
    create_list(:transaction, 5, invoice_id: id)

    get "/api/v1/invoices/#{id}/transactions"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants['data'].count).to eq(5)
  end
end
