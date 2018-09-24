class Account < ApplicationRecord
  belongs_to :user
  belongs_to :pair, optional: true
  has_many :orders

  def calculate_trading_balance
    orders.map(&:value).sum
  end

  def calculate_cash_balance(order_value)
    balance - order_value
  end

  def total_trades
    user.orders.count
  end
end
