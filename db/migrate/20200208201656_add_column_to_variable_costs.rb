class AddColumnToVariableCosts < ActiveRecord::Migration[6.0]
  def change
    add_column :variable_costs, :checked, :boolean, default: false
  end
end
