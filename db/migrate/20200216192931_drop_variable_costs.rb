class DropVariableCosts < ActiveRecord::Migration[6.0]
  def change
    drop_table :variable_costs
  end
end
