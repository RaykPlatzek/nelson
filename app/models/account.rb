class Account < ApplicationRecord
  belongs_to :user
  belongs_to :pair, optional: true
  has_many :orders

  def last_account_valuation
    return 0 unless pair.valuations.present?
    units / pair.last_valuations(1).first.price
  end

  def current_account_valuation
    return 0 unless pair.valuations.present?
    units * pair.current_valuation.price
  end

  def total_trades
    user.orders.count
  end
end
