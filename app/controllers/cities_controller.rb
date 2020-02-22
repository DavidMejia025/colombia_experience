class CitiesController < ApplicationController
  def index
    @cities = City.all

    if params[:quote_id]
      @quote = Quote.find(params[:quote_id])
      puts "adfasfafafaf"
      puts params
      render :quote_city_index
    else
      render :index
    end
  end

  def create
    if params[:quote_id]
      @quote = params[:quote_id]
      @city  = params[:id]

      render :quote_city_index
    else
      city = City.create(name: params[:city][:name])
      @cities = City.all
      render :index
    end
  end

  def new
  end

  def delete
  end

  def show
    if params[:quote_id]
      @quote = Quote.find(params[:quote_id])
      @city  = City.find(params[:id])

      @quote.cities << @city
      @city_activities = @city.activities.where(quote_id: nil)#Activity.all.where(city_id: @city).uniq

      render :quote_city_show
    else
      @city  = params[:id]
    end
  end

  def edit
  end
end
