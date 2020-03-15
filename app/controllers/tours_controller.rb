class ToursController < ApplicationController
  #before_action :get_tour_city_and_quote, except: [:show]

  def index
    @city = City.find(params[:city_id])
    @tour = Tour.new

    if @city
      @tours = @city.tours
    end
  end

  def quote_tour_services
    quote_tour_params = params[:id].split(",")

    @tour = Tour.find(quote_tour_params.second.to_i)
    @quote = Quote.find(quote_tour_params.first.to_i)

    render "quote_tour_services"
  end

  def new
    @quote = Quote.find(params[:quote_id])

    if @quote
      @cities = params[:city_id] ? City.where(id: params[:city_id]) : City.all

      @tours = @cities.map { |city| Tour.all.where(city_id: city.id) }.flatten
    else
      @city = City.find(params[:city_id])
      @categories = Category.all
    end
  end

  def select_new_service
    @city    = City.find(params[:city_id])
    @categories = Category.all
    @tour = Tour.find(params[:id])
    render "new_service"
  end

  def select_category_service
    @tour    = Tour.find(params[:id])
    @city    = @tour.city
    @vendors = Vendor.where(category_id: params[:category_id])

    puts @vendors

    render "new_tour_services"
  end

  def select_vendor_service
    @tour    = Tour.find(params[:id])
    @city    = @tour.city
    @vendor = Vendor.find(params[:vendor_id])
    @services = @city.services.where(vendor_id: @vendor.id)

    puts @services

    render "new_tour_services"
  end

  def select_service
    @tour    = Tour.find(params[:id])
    @city    = @tour.city
    @service = Service.find(params[:service_id])

    @tour.services << @service

    redirect_to city_tour_path(@city, @tour)
  end

  def show
    @tour = Tour.find(params[:id])
    @services = @tour.services
    if params[:quote_id]
      @quote = Quote.find(params[:quote_id])
    elsif params[:city_id]
      @city = City.find(params[:city_id])
    end
  end

  def create
    @city = City.find(params[:city_id])

    @city.tours.create!(
      name:        tour_params[:name],
      description: tour_params[:description],
    )

    redirect_to city_tour_path(@city, @city.tours.last)
  end

  def create_quote_tour
    @tour = Tour.find(params[:tour_id])
    @quote = Quote.find(params[:id])

    @tour.tour_costs.create(pax: 10, quote_id: @quote.id)
    render "quote_tour_services"
  end

  def delete_quote_tour
    quote_tour_params = params[:id].split(",")

    @tour = Tour.find(quote_tour_params.second.to_i)
    @quote = Quote.find(quote_tour_params.first.to_i)

    remove_tour_services(tour: @tour, quote: @quote)

    tour_costs = @tour.tour_costs

    tour_costs.each {|tour_cost| tour_cost.delete}

    redirect_to quote_path(@quote)
  end

  def remove_tour_services(tour:, quote:)
    tour.services.each do |service|
      service_costs = service.service_costs.where(quote_id: quote.id)

      service_costs.each {|service_cost| service_cost.delete}
    end
  end

  def add_category_to_tour
  end

  def new_quote_services
    get_quote_service_params

    @cities_services =  @vendors.services

    @quote = Quote.find(params[:id])

    render "new_quote_services"
  end

  def get_service_city_and_quote
    @service = Service.find(params[:id]) if params[:id]

    @city = City.find(params[:city_id]) if params[:city_id]

    @quote = Quote.find(params[:quote_id]) if params[:quote_id]
  end

  def get_vendor(vendor_id:, vendor_name:)
    if vendor_name.blank?
      @vendor = Vendor.find(vendor_id)

      return @vendor
    end

    @category = get_category(category_id: service_params[:id])

    @vendor = @city.vendors.create!(name: vendor_name, category_id: @category.id)
  end

  def get_category(category_id:)
    @category = Category.find(category_id)
  end

  def tour_params()
    params.require(:tour).permit(
      :city,
      :vendor_id,
      :vendor,
      :id,
      :name,
      :description,
      :id,
      :vendor
    )
  end
end
