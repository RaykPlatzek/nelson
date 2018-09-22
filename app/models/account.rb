class Account < ApplicationRecord
  belongs_to :user
  belongs_to :pair
  has_many :orders
end
