class Order < ApplicationRecord
  belongs_to :account
  belongs_to :user
  belongs_to :pair
  after_save :update_account_balance

  def sell_order?
    order_type == ORDER_TYPE_SELL 
  end

  def buy_order?
    order_type == ORDER_TYPE_BUY
  end

  private

  def update_account_balance
    account.update(balance: account.calculate_trading_balance)
    user.cash_account.update(balance: user.cash_account.calculate_cash_balance(value))
  end
end
