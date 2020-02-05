class CitiesController < ApplicationController
  def index
    puts "!!!!!!!!!!!!!!!!!!!!!!"
    @quote = Quote.find(params[:quote_id])
    @cities = City.all
  end

  def create
  end

  def new
  end

  def delete
  end

  def show
    puts params
    @qoute = params[:quote_id]
    @city = params[:id]
  end

  def edit
  end
end
