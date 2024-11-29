class Mutations::CreateQuote < Mutations::BaseMutation
  argument :name, String, required: true

  field :quote, Types::QuoteType, null: false
  field :errors, [String], null: false

  def resolve(name)
    quote = Quote.new(name)

    if quote.save
      { quote: quote, errors: [] }
    else
      { quote: nil, errors: quote.errors.full_messages }
    end
  end
end
