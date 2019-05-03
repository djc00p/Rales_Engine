require 'rails_helper'

describe "Invoice API" do
  it "sends a list of invoices" do
    merch = create(:merchant)
    customer1, customer2, customer3, customer4 = create_list(:customer, 4)
    invoice1 = create(:invoice, customer_id: customer3.id, merchant_id: merch.id)
    invoice2 = create(:invoice, customer_id: customer2.id, merchant_id: merch.id)
    invoice3 = create(:invoice, customer_id: customer1.id, merchant_id: merch.id)
    invoice4 = create(:invoice, customer_id: customer4.id, merchant_id: merch.id)

    get '/api/v1/invoices'

    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(invoices['data'].count).to eq(4)
  end

  it "can get one merchant by its id" do
    merch = create(:merchant)
    customer = create(:customer)
    id = create(:invoice, customer_id: customer.id, merchant_id: merch.id).id

    get "/api/v1/invoices/#{id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant['data']["id"].to_i).to eq(id)
  end
end
