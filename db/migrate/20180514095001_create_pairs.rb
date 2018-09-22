class CreatePairs < ActiveRecord::Migration[5.2]
  def change
    create_table :pairs do |t|
      t.string :code
      t.decimal :price, precision: 35, scale: 8, default: 0.0
      t.decimal :bid, precision: 35, scale: 8, default: 0.0
      t.decimal :ask, precision: 35, scale: 8, default: 0.0
      t.string :trend, default: TREND_NO_CHANGE
      t.integer :timestamp, :limit => 8
      t.timestamps
    end
  end
end
