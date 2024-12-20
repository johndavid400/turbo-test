# frozen_string_literal: true

module Types
  class QuoteType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user_id, Integer, null: false

    # GraphQL association for User:
    field :user, Types::UserType, null: false
  end
end
