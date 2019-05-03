require 'rails_helper'

describe "Invoice API" do
  it "sends a merchant" do
    merch = create(:merchant)
    customer3 = create(:customer)
    id = create(:invoice, customer_id: customer3.id, merchant_id: merch.id).id

    get "/api/v1/invoices/#{id}/merchant"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants['data']['attributes']["name"]).to eq(merch.name)
  end
end
