class ServicesController < ApplicationController
  before_action :get_service_city_and_quote

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
