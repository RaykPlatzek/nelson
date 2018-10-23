Types::ValuationType = GraphQL::ObjectType.define do
  name 'Valuation'
  field :id, !types.ID
  field :price, !types.Float
  field :bid, !types.Float
  field :ask, !types.Float
  field :pair_id, !types.Int 
end