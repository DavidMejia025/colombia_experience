class OptionsController < ApplicationController
  def show
    @service = Service.find(params[:service_id])

    @option = Option.find(params[:id])
  end

  def create
    if params[:price]
      @option = Option.find(params[:price][:option_id])

      @option.prices.create!(
        capacity: params[:price][:capacity],
        value: params[:price][:value]
      )
      @service = @option.service
    else
      @service = Service.find(option_params[:service_id])

      @service.options.create!(
        name:        option_params[:name],
        description: option_params[:description],
      )

      @option = @service.options.last
    end
    redirect_to service_option_path(@service, @option)
  end

  def option_params
    params.require(:option).permit(:name, :description, :service_id)
  end
end
