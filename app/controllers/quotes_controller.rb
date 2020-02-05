class QuotesController < ApplicationController
  def index
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quotes_paras)

    if @quote.save
      redirect_to quote_cities_path(@quote)
    else
      redirect_to :quotes_path
    end
  end

  def delete
  end

  def show
  end

  def edit
  end

  def quotes_paras
    params.require(:quote). permit(:trm, :margin)
  end
end
