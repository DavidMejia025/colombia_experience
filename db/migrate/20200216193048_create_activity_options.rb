class CreateActivityOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_options do |t|
      t.integer :capacity
      t.integer :cost
      t.integer :sub_activity_id
      t.integer :activity_id

      t.timestamps
    end
  end
end
