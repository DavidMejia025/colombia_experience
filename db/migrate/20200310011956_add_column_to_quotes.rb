class AddColumnToQuotes < ActiveRecord::Migration[6.0]
  def change
    add_column :quotes, :cost,             :integer
    add_column :quotes, :cost_per_person,  :integer
  end
end
