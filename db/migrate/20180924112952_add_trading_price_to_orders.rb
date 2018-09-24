class AddTradingPriceToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :trading_price, :decimal, precision: 35, scale: 2
  end
end
