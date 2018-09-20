class CreatePairs < ActiveRecord::Migration[5.2]
  def change
    create_table :pairs do |t|
      t.string :code
      t.decimal :price
      t.decimal :bid
      t.decimal :ask
      t.string :trend
      t.integer :timestamp, :limit => 8
      t.timestamps
    end
  end
end
