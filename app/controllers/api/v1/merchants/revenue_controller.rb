class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    render json: MerchantSerializer.new(Merchant.revenue(params[:date]))
  end
end
