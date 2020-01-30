class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :description
      t.integer :fixed_cost

      t.timestamps
    end
  end
end
