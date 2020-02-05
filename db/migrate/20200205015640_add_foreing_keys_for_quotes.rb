class AddForeingKeysForQuotes < ActiveRecord::Migration[6.0]
  def change
    add_column :tours,          :quote_id,      :integer
    add_column :activities,     :quote_id,      :integer
  end
end
