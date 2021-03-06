class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.integer :pair_id
      t.decimal :balance, precision: 35, scale: 2, default: 0.0
      t.timestamps
    end
  end
end
