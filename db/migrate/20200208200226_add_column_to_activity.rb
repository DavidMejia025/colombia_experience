class AddColumnToActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :total,             :integer
    add_column :activities, :total_per_person,  :integer
    add_column :activities, :days,              :integer
    add_column :activities, :ocupation,         :integer
  end
end
