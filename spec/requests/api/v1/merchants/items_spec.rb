require 'rails_helper'

describe "Merchant API" do
  it "sends a list of mercahnt items" do
    merch = create(:merchant)
    item1, item2, item3, item4 = create_list(:item, 4, merchant_id: merch.id)

    get "/api/v1/merchants/#{merch.id}/items"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants['data'].count).to eq(4)
  end
end
