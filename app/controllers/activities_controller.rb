class ActivitiesController < ApplicationController
  def index
  end

  def new
    puts "2@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2222"
    puts params
    @activity = Activity.new

    if params[:quote_id]
      @quote = Quote.find(params[:quote_id])
      @city  = params[:city_id]
      @city_activities = City.find(@city).activities.where(quote_id: nil)
    else
    end
  end

  def create
    if params[:quote_id]
      @quote    = Quote.find(params[:quote_id])

      activity = Activity.find(params[:activity][:id])
      # activity.update(days: activities_params[:days], ocupation: activities_params[:ocupation])
      #
      @quote.add_activity(activity: activity)
      #
      # redirect_to quote_city_path(params[:quote_id], params[:activity][:city])
      redirect_to edit_quote_activity_path(params[:quote_id], Activity.last.id)
    else
      city = City.find(params[:city_id])

      city.activities.create(activities_params)

      redirect_to city_path(params[:city_id])
    end
  end

  def add_to_quote
      puts "heyyyyyyyyyyyyyahay"
      activity = params[:activity]

      activity.calculate_cost

      activity.calculate_cost_per_person
  end

  def calculate_cost


  end
  def delete
  end

  def show
  end

  def edit
    puts "xiamomiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
    puts params
    @activity = Activity.find(params[:id])
    @quote = Quote.find(params[:quote_id])
  end

  def activities_params
    params.require(:activity).permit(:name, :description, :days, :ocupation)
  end

  def get_activity_params(activity: activity)
    activity = JSON.parse(activity.to_json)

  end
end
