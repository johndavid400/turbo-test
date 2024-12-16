# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject

    field :test_field, String, null: false, description: "An example field added by the generator"

    def test_field
      "Hello World"
    end

    field :create_quote, Types::QuoteType, null: false do
      description "Create a quote"
      argument :name, String, required: true, description: "The name of the quote."
    end

    def create_quote(name:)
      @quote = Quote.create(user_id: 1, name: name)
      @quote
    end

  end
end
