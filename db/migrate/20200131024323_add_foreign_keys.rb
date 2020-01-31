class AddForeignKeys < ActiveRecord::Migration[6.0]
  def change
    add_column :activities,     :city_id,      :integer
    add_column :activities,     :tour_id,      :integer 
    add_column :tours,          :city_id,      :integer
    add_column :variable_costs, :activity_id,  :integer
  end
end
