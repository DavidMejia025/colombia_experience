class CreateQuotesOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes_options do |t|
      t.integer :quote_id
      t.integer :option_id
    end
  end
end
