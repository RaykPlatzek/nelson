class DeleteObsoletePairColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :pairs, :price
    remove_column :pairs, :bid
    remove_column :pairs, :ask
  end
end
