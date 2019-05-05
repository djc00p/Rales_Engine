class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    render json: MerchanSerializer.new(Merchant.total_revenue_by_date(params[:date]))
  end
  def show
    if params[:date]
      binding.pry
      render json: MerchantSerializer.new(Merchant.total_revenue_invoice_date(params[:date], params[:id]))
    else
      render json: MerchantSerializer.new(Merchant.find(params[:id]))
    end
  end
end
