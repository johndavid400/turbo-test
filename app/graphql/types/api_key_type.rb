# frozen_string_literal: true

module Types
  class ApiKeyType < Types::BaseObject
    field :id, ID, null: false
    #field :token, String
    #field :secret, String
    field :deleted_at, GraphQL::Types::ISO8601DateTime
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user_id, Integer, null: false

    # GraphQL association for User:
    field :user, Types::UserType, null: false
  end
end
