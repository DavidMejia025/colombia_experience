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
    @quote = Quote.find(params[:id])

    @quote.service_costs.each do |service_cost|
      calculate_service_cost_costs(service_cost: service_cost)
    end

    cost = @quote.service_costs.pluck(:cost).sum
    cost_per_person = @quote.service_costs.pluck(:cost_per_person).sum

    @quote.update!(cost: cost)
    @quote.update!(cost_per_person: cost_per_person)

puts "12312313"
puts @quote.to_json

    redirect_to  quote_path(@quote)
  end

  def calculate_service_cost_costs(service_cost:)
    price = Price.find(service_cost.price_id)

    pax = service_cost.pax

    services = service_cost.services

    unless price.capacity == 1
      cost = price.value * services
      cost_per_person = cost / pax
    else
      cost = price.value * pax * services
      cost_per_person = price.value * services
    end

    service_cost.update!(cost: cost)
    service_cost.update!(cost_per_person: cost_per_person)
  end
end
