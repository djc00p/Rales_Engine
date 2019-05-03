class Api::V1::InvoiceItems::RandomController < ApplicationController

  def show
    render json: InvoiceItemSerializer.new(InvoiceItem.order(Arel.sql('RANDOM()')).first)
  end
end
