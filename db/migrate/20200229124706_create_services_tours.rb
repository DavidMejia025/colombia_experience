class CreateServicesTours < ActiveRecord::Migration[6.0]
  def change
    create_table :services_tours do |t|
      t.integer :tour_id
      t.integer :service_id
    end
  end
end
