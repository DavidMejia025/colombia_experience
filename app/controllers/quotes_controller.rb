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

    @service.service_costs.create!({services: params[:services], pax: params[:pax], quote_id: @quote.id})
    @service = Service.find(params[:service_id])

    render  "new_quote_options" # and return
  end

  def add_quote_option
    @quote = Quote.find(params[:id])
    @option = Option.find(params[:option_id])

    service_cost = @quote.service_costs.last
    service_cost.update!(option_id: @option.id)

    render  "new_quote_prices"
  end

  def add_quote_price
    @quote  = Quote.find(params[:id])
    @price = Price.find(params[:price_id])

    service_cost = @quote.service_costs.last
    service_cost.update!(price_id: @price.id)

    redirect_to  quote_path(@quote)
  end

  def calculate_cost
    @quote =  Quote.find(params[:id])

    @quote.service_costs.each do |service_cost|
      calculate_service_cost_costs(service_cost: service_cost)
    end

    redirect_to  quote_path(@quote)
  end

  def calculate_service_cost_costs(service_cost:)
    price = Price.find(service_cost.price_id).value

    pax = service_cost.pax

    services = service_cost.services

    service_cost.update!(price * pax * services)
  end
end
