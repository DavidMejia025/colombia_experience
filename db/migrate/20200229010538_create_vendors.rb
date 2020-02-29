class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :email,         default: "exito@aol.com"
      t.integer :phone,        default: "123456789"
      t.integer :category_id
      t.timestamps
    end
  end
end
