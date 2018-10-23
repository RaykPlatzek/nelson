Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :allPairs, !types[Types::PairType] do
    resolve ->(obj, args, ctx) { Pair.all }
  end

  field :Valuations, !types[Types::ValuationType] do
    resolve ->(obj, args, ctx) { Valuation.all }
  end

  field :allOrders, !types[Types::OrderType] do
    resolve ->(obj, args, ctx) {Order.all}
  end
end
