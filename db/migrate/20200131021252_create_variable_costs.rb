class CreateVariableCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :variable_costs do |t|
      t.integer :capacity
      t.integer :cost

      t.timestamps
    end
  end
end
