class QuotesController < ApplicationController
  def index
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quotes_params)

    if @quote.save
      redirect_to quote_cities_path(@quote)
    else
      redirect_to :quotes_path
    end
  end

  def delete
  end

  def show
    @quote  = params[:id]
  end

  def edit
  end

  def cost
    @quote = Quote.find(params[:id])

    @quote.calculate_total_cost
    @quote.calculate_total_cost_per_person

    @quote = @quote.id
    render :show
  end

  def quotes_params
    params.require(:quote). permit(:name, :trm, :margin)
  end
end

#
# <% activity.variable_costs do |variable_cost| %>
#   <tr>
#       <td>  Checked: <%= variable_cost.checked %> </td>
#       <td>  Cost: <%= variable_cost.cost %> </td>
#       <td>  Capacity: <%= variable_cost.capacity %> </td>
#       <td>  "" </td>
#   </tr>
# <% end%>
