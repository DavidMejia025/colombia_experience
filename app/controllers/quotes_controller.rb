class QuotesController < ApplicationController
  def index
    @quote = Quote.new
  end
end
