class CreateCitiesQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :cities_quotes do |t|
      t.integer :city_id
      t.integer :quote_id
      t.timestamps
    end
  end
end
