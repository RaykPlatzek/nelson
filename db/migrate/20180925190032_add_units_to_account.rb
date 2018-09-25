class AddUnitsToAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :units, :decimal, precision: 35, scale: 6, default: 0.0
    Account.all.each do |account| 
      next unless account&.orders&.present?
      units = account.orders.map{|order| order.trading_price * order.value }.sum
      account.update(units: units)
    end
  end
end
