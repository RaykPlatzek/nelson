class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :account_id
      t.integer :user_id
      t.integer :pair_id
      t.decimal :value, precision: 35, scale: 2, default: 0.0
      t.string :order_type
      t.timestamps
    end
  end
end
