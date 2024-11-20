# frozen_string_literal: true

module Types
  class QuoteType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :title, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def title
      object.name&.titleize
    end
  end
end
