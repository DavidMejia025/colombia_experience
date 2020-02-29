class CreateTourCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :tour_costs do |t|
      t.integer :pax,      default: 7
      t.integer :quote_id
      t.integer :tour_id
      t.timestamps
    end
  end
end
