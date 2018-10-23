class Resolvers::CreateOrder < GraphQL::Function
  argument :account_id, !types.ID
  argument :user_id, !types.ID
  argument :value, !types.Float
  argument :order_type, !types.String
  argument :pair_id, !types.Int

  type Types::OrderType

  def call(_obj, args, _ctx)
    Order.create!(
      account_id: args[:account_id],
      user_id: args[:user_id],
      value: args[:value],
      order_type: args[:order_type],
      pair_id: args[:pair_id],
      trading_price: Pair.find_by(id: args[:pair_id]).current_valuation.price
      )
  end
end