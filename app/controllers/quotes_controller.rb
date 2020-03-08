class QuotesController < ApplicationController
  def index
    @quote = Quote.new
  end

  def show
    @quote = Quote.find(params[:id])
    @services = @quote.services
  end

  def add_quote_service
    @quote = Quote.find(params[:id])
    @service = Service.find(params[:service_id])

    @quote.cities << @service.city

    @service.service_cost.create!({services: params[:services], pax: params[:pax], quote_id: @quote.id})
    @service = Service.find(params[:service_id])

    render  "new_quote_options" # and return
  end

  def add_quote_option
    @quote = Quote.find(params[:id])
    @option = Option.find(params[:option_id])

    @quote.options << @option

    render  "new_quote_prices" # and return
  end

  def add_quote_price
    @quote  = Quote.find(params[:id])
    @price = Price.find(params[:price_id])

    @quote.prices << @price

    redirect_to  quote_path(@quote)
  end
end
