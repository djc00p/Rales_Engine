class Api::V1::Items::SearchController < ApplicationController

  def index
    if item_params[:unit_price]
      render json: ItemSerializer.new(Item.unit_price_find(item_params[:unit_price]))
    elsif item_params[:merchant_id]
      render json: ItemSerializer.new(Item.find_merchant(item_params))
    else
      render json: ItemSerializer.new(Item.where(item_params))
    end
  end

  def show
    if item_params[:unit_price]
      render json: ItemSerializer.new(Item.unit_price_find(item_params[:unit_price]).first)
    else
      render json: ItemSerializer.new(Item.where(item_params).first)
    end
  end

  private

  def item_params
    params.permit(:id, :merchant_id, :name, :description, :unit_price, :created_at, :updated_at)
  end
end
