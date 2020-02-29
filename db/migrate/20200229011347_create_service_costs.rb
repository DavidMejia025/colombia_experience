class CreateServiceCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :service_costs do |t|
      t.integer :services,  default: 1
      t.integer :pax,        default: 7
      t.integer :quote_id
      t.integer :service_id

      t.timestamps
    end
  end
end
