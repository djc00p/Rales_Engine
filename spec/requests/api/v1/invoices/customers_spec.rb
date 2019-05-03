require 'rails_helper'

describe "Invoice API" do
  it "sends a list of customer" do
    merch = create(:merchant)
    customer3 = create(:customer)
    id = create(:invoice, customer_id: customer3.id, merchant_id: merch.id).id

    get "/api/v1/invoices/#{id}/customer"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)
    
    expect(merchants['data']['attributes']["first_name"]).to eq(customer3.first_name)
  end
end
