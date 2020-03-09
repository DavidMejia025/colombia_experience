class CreateOptionsQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :options_quotes do |t|
      t.integer :option_id
      t.integer :quote_id
      t.timestamps
    end
  end
end
