require 'rails_helper'

describe "Invoice Search API" do
  it "show invoice api by id" do
    merch = create(:merchant)
    customer1, customer2, customer3, customer4 = create_list(:customer, 4)
    id = create(:invoice, customer_id: customer3.id, merchant_id: merch.id).id
    invoice2 = create(:invoice, customer_id: customer2.id, merchant_id: merch.id)
    invoice3 = create(:invoice, customer_id: customer1.id, merchant_id: merch.id)
    invoice4 = create(:invoice, customer_id: customer4.id, merchant_id: merch.id)

    get "/api/v1/invoices/find?id=#{id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice["data"]["id"].to_i).to eq(id)
  end

  it "show invoice api by customer_id" do
    merch = create(:merchant)
    customer1, customer2, customer3, customer4 = create_list(:customer, 4)
    id = create(:invoice, customer_id: customer3.id, merchant_id: merch.id).id
    invoice2 = create(:invoice, customer_id: customer2.id, merchant_id: merch.id)
    invoice3 = create(:invoice, customer_id: customer1.id, merchant_id: merch.id)
    invoice4 = create(:invoice, customer_id: customer4.id, merchant_id: merch.id)

    get "/api/v1/invoices/find?customer_id=#{customer1.id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice["data"]["id"].to_i).to eq(invoice3.id)
  end

  it "show invoice api by merchant_id" do
    merch = create(:merchant)
    customer1, customer2, customer3, customer4 = create_list(:customer, 4)
    id = create(:invoice, customer_id: customer3.id, merchant_id: merch.id).id
    invoice2 = create(:invoice, customer_id: customer2.id, merchant_id: merch.id)
    invoice3 = create(:invoice, customer_id: customer1.id, merchant_id: merch.id)
    invoice4 = create(:invoice, customer_id: customer4.id, merchant_id: merch.id)

    get "/api/v1/invoices/find?merchant_id=#{merch.id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice["data"]["id"].to_i).to eq(id)
  end

  it "show Invoices api by created_at" do
    merch = create(:merchant)
    customer1, customer2, customer3, customer4 = create_list(:customer, 4)
    id = create(:invoice, customer_id: customer3.id, merchant_id: merch.id, created_at: '2019-04-30 21:03:40 UTC')
    invoice2 = create(:invoice, customer_id: customer2.id, merchant_id: merch.id)
    invoice3 = create(:invoice, customer_id: customer1.id, merchant_id: merch.id)
    invoice4 = create(:invoice, customer_id: customer4.id, merchant_id: merch.id)

    get "/api/v1/invoices/find?created_at=#{id.created_at}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice["data"]["id"].to_i).to eq(id.id)
  end

  it "show Invoices api by updated_at" do
    merch = create(:merchant)
    customer1, customer2, customer3, customer4 = create_list(:customer, 4)
    id = create(:invoice, customer_id: customer3.id, merchant_id: merch.id, updated_at: '2019-04-30 21:03:40 UTC')
    invoice2 = create(:invoice, customer_id: customer2.id, merchant_id: merch.id)
    invoice3 = create(:invoice, customer_id: customer1.id, merchant_id: merch.id)
    invoice4 = create(:invoice, customer_id: customer4.id, merchant_id: merch.id)

    get "/api/v1/invoices/find?updated_at=#{id.updated_at}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice["data"]["id"].to_i).to eq(id.id)
  end

  it "show merchant api at random" do
    merch = create(:merchant)
    customer1, customer2, customer3, customer4 = create_list(:customer, 4)
    id = create(:invoice, customer_id: customer3.id, merchant_id: merch.id, updated_at: '2019-04-30 21:03:40 UTC')
    invoice2 = create(:invoice, customer_id: customer2.id, merchant_id: merch.id)
    invoice3 = create(:invoice, customer_id: customer1.id, merchant_id: merch.id)
    invoice4 = create(:invoice, customer_id: customer4.id, merchant_id: merch.id)

    get "/api/v1/invoices/random.json"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice.count).to eq(1)
  end

  it "show all invoice api" do
    merch = create(:merchant)
    customer1, customer2, customer3, customer4 = create_list(:customer, 4)
    id = create(:invoice, customer_id: customer3.id, merchant_id: merch.id).id
    invoice2 = create(:invoice, customer_id: customer2.id, merchant_id: merch.id)
    invoice3 = create(:invoice, customer_id: customer1.id, merchant_id: merch.id)
    invoice4 = create(:invoice, customer_id: customer4.id, merchant_id: merch.id)

    get "/api/v1/invoices/find_all?id=#{id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice["data"][0]["id"].to_i).to eq(id)
  end

  it "show all invoice by customer_id api" do
    merch = create(:merchant)
    customer1, customer2, customer3, customer4 = create_list(:customer, 4)
    id = create(:invoice, customer_id: customer3.id, merchant_id: merch.id)
    invoice2 = create(:invoice, customer_id: customer2.id, merchant_id: merch.id)
    invoice3 = create(:invoice, customer_id: customer1.id, merchant_id: merch.id)
    invoice4 = create(:invoice, customer_id: customer4.id, merchant_id: merch.id)

    get "/api/v1/invoices/find_all?customer_id=#{id.customer_id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice["data"][0]["id"].to_i).to eq(id.id)
  end

  it "show all invoice by merchant_id api" do
    merch = create(:merchant)
    customer1, customer2, customer3, customer4 = create_list(:customer, 4)
    id = create(:invoice, customer_id: customer3.id, merchant_id: merch.id)
    invoice2 = create(:invoice, customer_id: customer2.id, merchant_id: merch.id)
    invoice3 = create(:invoice, customer_id: customer1.id, merchant_id: merch.id)
    invoice4 = create(:invoice, customer_id: customer4.id, merchant_id: merch.id)

    get "/api/v1/invoices/find_all?merchant_id=#{id.merchant_id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice["data"][0]["id"].to_i).to eq(id.id)
  end

  it "show Invoices api find all by created_at" do
    merch = create(:merchant)
    customer1, customer2, customer3, customer4 = create_list(:customer, 4)
    id = create(:invoice, customer_id: customer3.id, merchant_id: merch.id, created_at: '2019-04-30 21:03:40 UTC')
    invoice2 = create(:invoice, customer_id: customer2.id, merchant_id: merch.id, created_at: '2019-04-30 21:03:40 UTC')
    invoice3 = create(:invoice, customer_id: customer1.id, merchant_id: merch.id)
    invoice4 = create(:invoice, customer_id: customer4.id, merchant_id: merch.id)

    get "/api/v1/invoices/find_all?created_at=#{id.created_at}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice["data"][0]["id"].to_i).to eq(id.id)
    expect(invoice["data"][1]["id"].to_i).to eq(invoice2.id)
  end

  it "show Invoices api find all by updated_at" do
    merch = create(:merchant)
    customer1, customer2, customer3, customer4 = create_list(:customer, 4)
    id = create(:invoice, customer_id: customer3.id, merchant_id: merch.id, updated_at: '2019-04-30 21:03:40 UTC')
    invoice2 = create(:invoice, customer_id: customer2.id, merchant_id: merch.id, updated_at: '2019-04-30 21:03:40 UTC')
    invoice3 = create(:invoice, customer_id: customer1.id, merchant_id: merch.id)
    invoice4 = create(:invoice, customer_id: customer4.id, merchant_id: merch.id)

    get "/api/v1/invoices/find_all?updated_at=#{id.updated_at}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice["data"][0]["id"].to_i).to eq(id.id)
    expect(invoice["data"][1]["id"].to_i).to eq(invoice2.id)
  end
end
