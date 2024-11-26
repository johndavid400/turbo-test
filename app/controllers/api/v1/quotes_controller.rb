module Api
  module V1
    class QuotesController < ::Api::ApiController
      before_action :set_quote, only: %i[ show ]

      # GET /quotes or /quotes.json
      def index
        @quotes = Quote.ordered
      end

      # GET /quotes/1 or /quotes/1.json
      def show
      end

      private
        # Use callbacks to share common setup or constraints between actions.
      def set_quote
        @quote = Quote.find(params[:id])
      end
    end
  end
end
