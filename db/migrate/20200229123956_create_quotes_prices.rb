class CreateQuotesPrices < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes_prices do |t|
      t.integer :quote_id
      t.integer :price_id
    end
  end
end
