Types::OrderType = GraphQL::ObjectType.define do
  name 'Order'
  field :id, !types.ID
  field :account_id, !types.ID
  field :user_id, !types.ID
  field :value, !types.Float
  field :order_type, !types.String
  field :pair_id, !types.ID
  field :trading_price, !types.Float
end