class SubActivitiesController < ApplicationController
  def new
    puts params
    @activity     = Activity.find(params[:activity_id])
    @sub_activity = SubActivity.new
end

  def create
    @activity = Activity.find(params[:activity_id])

    @sub_activity = @activity.sub_activities.create!(
      name: sub_activities_params[:name],
      description: sub_activities_params[:description]
    )

    redirect_to activity_sub_activity_path(@activity, @sub_activity)
  end

  def show
    @sub_activity = SubActivity.find(params[:id])
  end

  def sub_activities_params
    params.require(:sub_activity).permit(:name, :description)
  end
end
