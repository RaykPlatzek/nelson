class CreatePairs < ActiveRecord::Migration[5.2]
  def change
    create_table :pairs do |t|
      t.string :code
      t.decimal :price, default: 0
      t.decimal :bid, default: 0
      t.decimal :ask, default: 0
      t.string :trend, default: TREND_NO_CHANGE
      t.integer :timestamp, :limit => 8
      t.timestamps
    end
  end
end
