# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World"
    # end

    field :create_quote, mutation: Mutations::CreateQuote
    field :create_user, mutation: Mutations::CreateUser
    field :login, mutation: Mutations::Login
  end
end
