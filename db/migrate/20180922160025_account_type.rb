class AccountType < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :account_type, :string
  end
end
