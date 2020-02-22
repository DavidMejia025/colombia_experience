class ActivitiesController < ApplicationController
  def index
  end

  def new
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

      @activity

      redirect_to city_activity_path(city, city.activities.last)
    end
  end

  def calculate_cost


  end

  def update
    quote = Quote.find(params[:quote_id])
    city  = City.find(quote.activities.last.city_id)
    activity = Activity.find(params[:id])
    sub_activity = SubActivity.find(params[:sub_activity_id])
    activity_option = ActivityOption.find(params[:activity_option_id])

    activity.update(days: params[:days], ocupation: params[:ocupation])
    sub_activity.update(checked: true)
    activity_option.update(checked: true)

    redirect_to quote_city_path(quote.id, city.id)
  end

  def destroy
    @quote            = Quote.find(params[:quote_id])
    @activity         = Activity.find(params[:id])
    @sub_activities   = @activity.sub_activities
    @activity_options = @sub_activities.map {|sub_activity| sub_activity.activity_options }

    @activity_options.each {|activity_option| activity_option.destroy }
    @sub_activities.each {|sub_activity| sub_activity.destroy }
    @activity.destroy

    redirect_to quote_path(@quote)
  end

  def show
    if params[:quote_id]
      @activity = Activity.find(params[:id])
      @quote = Quote.find(params[:quote_id])
      @sub_activity = @activity.sub_activities.find_by(checked: true)
      @activity_option = @sub_activity.activity_options.find_by(checked: true)
      @city  = City.find(@activity.city_id)
    else
      @activity = Activity.find(params[:id])
      @city = City.find(params[:city_id])
    end
  end

  def edit
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
