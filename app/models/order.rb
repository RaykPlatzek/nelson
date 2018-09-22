class Order < ApplicationRecord
  belongs_to :account
  belongs_to :user
  belongs_to :pair
end
