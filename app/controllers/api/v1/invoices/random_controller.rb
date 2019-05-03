class Api::V1::Invoices::RandomController < ApplicationController

  def show
    render json: InvoiceSerializer.new(Invoice.order(Arel.sql('RANDOM()')).first)
  end
end
