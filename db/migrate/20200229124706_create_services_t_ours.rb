class CreateServicesTOurs < ActiveRecord::Migration[6.0]
  def change
    create_table :services_t_ours do |t|
      t.integer :tour_id
      t.integer :tour_id
    end
  end
end
