class VendorsController < ApplicationController
  def create
    puts "11111111111111111111111111111"
  end

  def vendor_params()
    params.require(:vendor).permit(
      :city,
      :vendor_id,
      :vendor,
      :id,
      :name,
      :description,
      :id,
      :vendor
    )
  end
end
