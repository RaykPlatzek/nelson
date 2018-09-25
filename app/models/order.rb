class Order < ApplicationRecord
  belongs_to :account
  belongs_to :user
  belongs_to :pair
  after_save :update_account

  def sell_order?
    order_type == ORDER_TYPE_SELL 
  end

  def buy_order?
    order_type == ORDER_TYPE_BUY
  end


  def valid
   return false if order_type == ORDER_TYPE_BUY && user.cash_account.balance < value.abs
   return false if order_type == ORDER_TYPE_SELL && account.current_account_valuation < value.abs
   true
  end

  def units_traded
    value * trading_price
  end

  private

  def update_account
    user.cash_account.update(balance: (user.cash_account.balance - value))
    account.update(units: account.units + units_traded)
  end
end
