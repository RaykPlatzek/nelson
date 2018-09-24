class AccountDecorator < Draper::Decorator
  delegate_all
  decorates_association :orders, with: OrderDecorator
end