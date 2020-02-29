class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.integer :capacity,  default: 1000
      t.integer :value,     default: 10
      t.integer :option_id
      t.timestamps
    end
  end
end
