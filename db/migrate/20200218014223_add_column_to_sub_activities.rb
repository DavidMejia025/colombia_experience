class AddColumnToSubActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :sub_activities, :checked, :boolean, default: false
  end
end
