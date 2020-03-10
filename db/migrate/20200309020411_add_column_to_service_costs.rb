class AddColumnToServiceCosts < ActiveRecord::Migration[6.0]
  def change
    add_column :service_costs, :option_id, :integer
    add_column :service_costs, :price_id,  :integer
  end
end
