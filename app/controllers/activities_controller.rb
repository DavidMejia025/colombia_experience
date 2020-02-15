class ActivitiesController < ApplicationController
  def index
  end

  def new
    @activity = Activity.new
  end

  def create
    if params[:quote_id]
      quote    = Quote.find(params[:quote_id])
      activity = Activity.find(params[:activity][:id])

      quote.add_activity(activity: activity)
puts params[:quoute_id]
      redirect_to quote_city_path(params[:quote_id], params[:activity][:city])
    else
      city = City.find(params[:city_id])

      city.activities.create(activities_params)

      redirect_to city_path(params[:city_id])
    end
  end

  def add_to_quote
    puts "heyyyyyyyyyyyyyahay"
  end

  def costs
    puts "heyyyddddddddddddddyyyyyyyyyyahay"

  end
  def delete
  end

  def show
  end

  def edit
  end

  def activities_params
    params.require(:activity).permit(:name, :description)
  end

  def get_activity_params(activity: activity)
    activity = JSON.parse(activity.to_json)

  end
end
