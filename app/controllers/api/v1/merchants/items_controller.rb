class Api::V1::Merchants::ItemsController < Api::V1::Merchants::ApplicationController
  def index
    @merchant = Merchant.find(params[:id])
    render json: MerchantSerializer.new(Item.where(merchant_id: @merchant))
  end
end
