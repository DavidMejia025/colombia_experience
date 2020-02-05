class CreateCitiesQoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :cities_qoutes do |t|
      t.integer :quote_id
      t.integer :city_id
      t.timestamps
    end
  end
end
