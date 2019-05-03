require 'rails_helper'

describe "Merchant API" do
  it "sends a list of merchant invoices" do
    merch = create(:merchant)
    customer1, customer2, customer3, customer4 = create_list(:customer, 4)
    item1 = create(:item, merchant_id: merch.id)
    item2 = create(:item, merchant_id: merch.id)
    item3 = create(:item, merchant_id: merch.id)
    item4 = create(:item, merchant_id: merch.id)
    invoice1 = create(:invoice, customer_id: customer3.id, merchant_id: merch.id)
    invoice2 = create(:invoice, customer_id: customer2.id, merchant_id: merch.id)
    invoice3 = create(:invoice, customer_id: customer1.id, merchant_id: merch.id)
    invoice4 = create(:invoice, customer_id: customer4.id, merchant_id: merch.id)
    invoice_item1 = create(:invoice_item, invoice: invoice1, item: item1)
    invoice_item1 = create(:invoice_item, invoice: invoice2, item: item2)
    invoice_item1 = create(:invoice_item, invoice: invoice4, item: item4)
    invoice_item1 = create(:invoice_item, invoice: invoice3, item: item3)

    get "/api/v1/merchants/#{merch.id}/invoices"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants['data'].count).to eq(4)
  end
end
