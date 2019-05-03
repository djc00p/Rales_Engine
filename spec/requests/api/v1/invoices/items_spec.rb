require 'rails_helper'

describe "Invoice API" do
  it "sends a list of items" do
    merch = create(:merchant)
    item1, item2, item3, item4, item5 = create_list(:item, 5, merchant_id: merch.id)
    customer3 = create(:customer)
    id = create(:invoice, customer_id: customer3.id, merchant_id: merch.id).id
    invoice1 = create(:invoice_item, invoice_id: id, item_id: item1.id)
    invoice2 = create(:invoice_item, invoice_id: id, item_id: item3.id)
    invoice3 = create(:invoice_item, invoice_id: id, item_id: item4.id)
    invoice4 = create(:invoice_item, invoice_id: id, item_id: item5.id)
    invoice5 = create(:invoice_item, invoice_id: id, item_id: item2.id)

    get "/api/v1/invoices/#{id}/items"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants['data'].count).to eq(5)
  end
end
