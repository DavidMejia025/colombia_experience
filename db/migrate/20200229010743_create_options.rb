class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.string :name
      t.string :description, default: "bla bla bla bla blaaaaaaaaa"
      i.integer :service_id
      t.timestamps
    end
  end
end
