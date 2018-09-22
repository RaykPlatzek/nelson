class CreateValuations < ActiveRecord::Migration[5.2]
  def change
    create_table :valuations do |t|
      t.integer :pair_id
      t.decimal :price, default: 0
      t.decimal :bid, default: 0
      t.decimal :ask, default: 0
      t.timestamps
    end
  end
end
