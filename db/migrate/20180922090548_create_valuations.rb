class CreateValuations < ActiveRecord::Migration[5.2]
  def change
    create_table :valuations do |t|
      t.integer :pair_id
      t.decimal :price
      t.decimal :bid
      t.decimal :ask
      t.timestamps
    end
  end
end
