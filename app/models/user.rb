class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :accounts
  has_many :orders
  after_create :create_cash_account

  def self.leaders_by_cash_account
    leading_cash_accounts = Account.where(account_type: CASH_ACCOUNT).order(balance: :desc).take(LEADER_BOARD_LENGTH)
    leading_cash_accounts.map {|account| account.user}
  end

  def trades
    orders.count
  end

  def cash_account_balance
    cash_account.balance
  end

  def money_invested
    trading_accounts.all.map(&:balance).sum
  end

  def has_account?(account)
    return false unless trading_accounts.present?
    return true if (trading_accounts.map {|account| account&.pair&.code}).include?(account&.pair&.code)
    false
  end

  def cash_account 
    accounts.find_by(account_type: CASH_ACCOUNT)
  end

  def trading_accounts
    accounts.where(account_type: TRADING_ACCOUNT)
  end

  def level_label
    case level
      when 1 
        label = "Gambler"
      when 2
        label = "Layman Investor"
      when 3
        label = "Investor"
      when 4
        label = "Expert Investor"
      when 5
        label = "Broker"
      when 5
        label = "Gordon"     
      else
        label = "Roughless"
      end
      label
  end

  private

  def create_cash_account
    accounts.create!(account_type: CASH_ACCOUNT, balance: STARTING_BALANCE)
  end
end
