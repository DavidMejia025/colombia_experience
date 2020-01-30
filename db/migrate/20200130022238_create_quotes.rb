class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.string :name
      t.integer :total
      t.integer :total_per_person
      t.integer :margin
      t.integer :trm

      t.timestamps
    end
  end
end
