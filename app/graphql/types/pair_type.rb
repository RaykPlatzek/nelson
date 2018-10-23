Types::PairType = GraphQL::ObjectType.define do
  name 'Pair'
  field :id, !types.ID
  field :code, !types.String
  field :trend, !types.String
  # field :valuations, types[ValuationType]  
end