class CreateTourCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :tour_costs do |t|
      t.int :pax

      t.timestamps
    end
  end
end
