class CreatePricesQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :prices_quotes do |t|
      t.integer :price_id
      t.integer :quote_id
      t.timestamps
    end
  end
end
