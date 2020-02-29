class CreateServiceCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :service_costs do |t|
      t.int :services
      t.int :pax

      t.timestamps
    end
  end
end
