class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.string :client,  default: "Operador NYC"
      t.integer :trm,    default:     3235
      t.integer :margin, default:     24
      t.string :currency, default:   "COP"
      t.integer :client_id
      t.timestamps
    end
  end
end
