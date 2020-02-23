class ActivityOptionsController < ApplicationController
  def new
    @sub_activity = SubActivity.find(params[:sub_activity_id]) if params[:sub_activity_id]
    @activity = Activity.find(params[:activity_id])            if params[:activity_id]
    @activity_option = ActivityOption.new
  end

  def create
    if params[:sub_activity_id]
      @sub_activity = SubActivity.find(params[:sub_activity_id])

      @activity_option = @sub_activity.activity_options.create!(
        capacity: activity_option_params[:capacity],
        cost: activity_option_params[:cost]
      )

      redirect_to activity_sub_activity_path(@sub_activity.activity, @sub_activity)
    else
      @activity = Activity.find(params[:activity_id])

      @activity_option = @activity.activity_options.create!(
        capacity: activity_option_params[:capacity],
        cost: activity_option_params[:cost]
      )

      redirect_to city_activity_path(@activity.city, @activity)
    end
  end

  def show
    @sub_activity = SubActivity.find(params[:id])
  end

  def activity_option_params
    params.require(:activity_option).permit(:capacity, :cost)
  end
end
