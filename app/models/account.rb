class Account < ApplicationRecord
  belongs_to :user
  belongs_to :pair, optional: true
  has_many :orders
end
