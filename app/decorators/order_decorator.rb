class OrderDecorator < Draper::Decorator
  delegate_all
  decorates_association :account, with: AccountDecorator
  
  def direction

  end

  def color

  end
end