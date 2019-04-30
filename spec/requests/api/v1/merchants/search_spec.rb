require 'rails_helper'

describe "Merchant Search API" do
  it "show merchant api by id" do
    id = create(:merchant, name: 'Aria').id

    get "/api/v1/merchants/find?id=#{id}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["data"]["id"].to_i).to eq(id)
  end

  it "show merchant api by name" do
    name = create(:merchant, name: 'Aria').name

    get "/api/v1/merchants/find?name=#{name}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["data"]["attributes"]["name"]).to eq(name)
  end

  it "show merchant api by created_at" do
    merch_1 = create(:merchant, name: 'Aria', created_at: '2019-04-30 21:03:40 UTC')
    merch_2 = create(:merchant, name: 'Sansa', created_at: '2019-04-27 20:00:30 UTC')

    get "/api/v1/merchants/find?created_at=#{merch_1.created_at}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["data"]["attributes"]["name"]).to eq(merch_1.name)
  end

  it "show merchant api by updated_at" do
    merch_1 = create(:merchant, name: 'Aria', created_at: '2019-04-15 16:03:40 UTC', updated_at: '2019-04-30 20:03:40 UTC' )
    merch_2 = create(:merchant, name: 'Sansa', created_at: '2019-04-27 20:00:30 UTC', updated_at: '2019-04-30 20:05:40 UTC')

    get "/api/v1/merchants/find?updated_at=#{merch_2.updated_at}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["data"]["attributes"]["name"]).to eq(merch_2.name)
  end

  it "show merchant api at random" do
    merch_1 = create(:merchant, name: 'Aria', created_at: '2019-04-15 16:03:40 UTC', updated_at: '2019-04-30 20:03:40 UTC' )
    merch_2 = create(:merchant, name: 'Sansa', created_at: '2019-04-27 20:00:30 UTC', updated_at: '2019-04-30 20:05:40 UTC')

    get "/api/v1/merchants/random.json"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant.count).to eq(1)
  end

  it "show all merchants api" do
    merch_1 = create(:merchant, name: 'Aria', created_at: '2019-04-15 16:03:40 UTC', updated_at: '2019-04-30 20:03:40 UTC' )
    merch_2 = create(:merchant, name: 'Sansa', created_at: '2019-04-27 20:00:30 UTC', updated_at: '2019-04-30 20:05:40 UTC')

    get "/api/v1/merchants/find_all?name=#{merch_1.name}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["data"].count).to eq(1)
  end
end
