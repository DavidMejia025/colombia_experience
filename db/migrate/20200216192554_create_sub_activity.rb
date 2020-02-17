class CreateSubActivity < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_activities do |t|
      t.string :name
      t.string :description
      t.string :activity_id
      
      t.timestamps
    end
  end
end
