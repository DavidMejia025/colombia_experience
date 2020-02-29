class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.string :client
      t.integer :trm
      t.int :margin
      t.string :currency

      t.timestamps
    end
  end
end
