class CreateCitiesVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :cities_vendors do |t|
      t.integer :city_id
      t.integer :vendor_id
      t.timestamps
    end
  end
end
