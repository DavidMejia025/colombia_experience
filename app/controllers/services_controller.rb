class ServicesController < ApplicationController
  before_action :get_service_city_and_quote, except: [:show, :add_quote_options, :new_quote_services, :add_quote_service, :new_quote_tour_services]

  def index
    if @city
      @city
      @vendors = @city.vendors
      @categories = Vendor.all.map{ |vendor| vendor.category }

      @categories
      @vendors
      @city_services = Service.where(city_id: @city.id)
    end
  end

  def new
    @quote = Quote.find(params[:quote_id])

    get_quote_service_params()
  end

  def show
    @service = Service.find(params[:id])

    if params[:quote_id]
      @quote = Quote.find(params[:quote_id])
    elsif params[:city_id]
      @city = City.find(params[:city_id])
    end
  end

  def create
    @vendor = get_vendor(vendor_id: service_params[:vendor_id], vendor_name: service_params[:vendor])

    @city.services.create!(
      name:        service_params[:name],
      description: service_params[:description],
      vendor_id:   @vendor.id
    )

    @vendors = @city.vendors
    @categories = Vendor.all.map{ |vendor| vendor.category }
    @city_services = Service.where(city_id: @city.id)
    @city

    redirect_to city_service_path(@city, @city.services.last)
  end

  def new_quote_services
    get_quote_service_params

    @cities_services =  @vendors.services

    @quote = Quote.find(params[:id])

    render "new_quote_services"
  end

  def new_quote_tour_services
    #get_quote_service_params
    quote_tour_service_params = params[:id].split(",")
    @service = Service.find(quote_tour_service_params[2])
    @tour = Tour.find(quote_tour_service_params[1])
    @quote = Quote.find(quote_tour_service_params[0])
    puts "I love youuuuuuuuuuuuuUUUUUU"
    #@cities_services =  @vendors.services

    @quote = Quote.find(params[:id])

    render "new_quote_services"
  end

  def get_quote_service_params
    @cities = params[:city_id] ? City.find(params[:city_id]) : City.all

    @vendors = params[:vendor_id] ? Vendor.find(params[:vendor_id]) : Vendor.all

    #@vendors = @vendors.where(category_id: params[:category_id]) if @vendors.length > 1 && params[:category_id]

    @categories = params[:category_id] ? Category.find(params[:category_id]) : Category.all
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

  def service_params()
    params.require(:service).permit(
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
