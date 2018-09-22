class CreateValuations < ActiveRecord::Migration[5.2]
  def change
    create_table :valuations do |t|
      t.integer :pair_id
      t.decimal :price, precision: 35, scale: 8, default: 0.0
      t.decimal :bid, precision: 35, scale: 8, default: 0.0
      t.decimal :ask, precision: 35, scale: 8, default: 0.0
      t.timestamps
    end
  end
end
