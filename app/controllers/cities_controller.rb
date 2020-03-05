class CitiesController < ApplicationController
  before_action :get_city_and_quote, except: :index

  def index
    @cities = City.all

    if params[:quote_id]
      @quote

      render :quote_city_index
    else
      render :index
    end
  end

  def show
    if params[:quote_id]
      @quote.cities << @city
      @city_activities = @city.activities.where(quote_id: nil)#Activity.all.where(city_id: @city).uniq

      render :quote_city_show
    else
      @city
    end
  end

  def get_city_and_quote
    @city = City.find(params[:id])
    
    @quote = Quote.find(params[:quote_id]) if params[:quote_id]
  end
end
