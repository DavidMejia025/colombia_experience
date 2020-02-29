class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name,         default: "Operador NYC"
      t.string :email,        default: "marathon@nyc.com"
      t.string :phone_number, default: 1004123123
      t.string :type,         default: "external"
      t.integer :discount,    default: "0"
      t.string  :image_url
      t.timestamps
    end
  end
end
