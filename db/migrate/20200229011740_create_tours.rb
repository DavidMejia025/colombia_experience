class CreateTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tours do |t|
      t.string :name
      t.string :description,    default: "This is a wonderful tour in Colombia Yeiii"
      t.integer :city_id
      t.timestamps
    end
  end
end
