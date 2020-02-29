class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.int :pax
      t.int :value

      t.timestamps
    end
  end
end
