class CreateTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tours do |t|
      t.string :name
      t.string :description
      t.integer :total
      t.integer :total_per_person

      t.timestamps
    end
  end
end
