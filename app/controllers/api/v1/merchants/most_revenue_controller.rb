class Api::V1::Merchants::MostRevenueController < Api::V1::Merchants::ApplicationController
  def show
    render json: MerchantSerializer.new(Merchant.most_revenue())
  end
end
