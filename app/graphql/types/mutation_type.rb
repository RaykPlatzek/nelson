Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"
  field :createOrder, function: Resolvers::CreateOrder.new 
end
