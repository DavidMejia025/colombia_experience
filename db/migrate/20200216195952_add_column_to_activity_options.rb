class AddColumnToActivityOptions < ActiveRecord::Migration[6.0]
  def change
    add_column :activity_options, :checked, :boolean, default: false
  end
end
