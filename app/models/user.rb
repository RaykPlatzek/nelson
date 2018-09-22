class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :accounts
  has_many :orders

  def overall_account_balance
    accounts.all.map(&:balance).sum
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
end
