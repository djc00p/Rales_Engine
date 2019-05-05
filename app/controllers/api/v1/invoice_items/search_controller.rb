class Api::V1::InvoiceItems::SearchController < ApplicationController

  def index
    if invoice_item_params[:unit_price]
      render json: InvoiceItemSerializer.new(InvoiceItem.unit_price_find(invoice_item_params[:unit_price]))
    else
      render json: InvoiceItemSerializer.new(InvoiceItem.where(invoice_item_params))
    end
  end

  def show
    if invoice_item_params[:unit_price]
      render json: InvoiceItemSerializer.new(InvoiceItem.unit_price_find(invoice_item_params[:unit_price]).first)
    else
      render json: InvoiceItemSerializer.new(InvoiceItem.where(invoice_item_params).first)
    end
  end

  private

  def invoice_item_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end
end
