class ActivitiesController < ApplicationController
  def index
  end

  def new
    @activity = Activity.new
  end

  def create
    if params[:quote_id]
      puts params
      puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1111"
      quote = Quote.find(params[:quote_id])
      activity = Activity.find(params[:activity][:id])
      activity_params = get_activity_params(activity: activity)

      quote.activities.create(JSON.parse(activity_json))
    else
      city = City.find(params[:city_id])

      city.activities.create(activities_params)

      redirect_to city_path(params[:city_id])
    end
  end

  def add_to_quote
    puts "heyyyyyyyyyyyyyahay"
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
