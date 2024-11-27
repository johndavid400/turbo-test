# app/controllers/quotes_controller.rb
# frozen_string_literal: true

module Api
  module V1
    # This API controller handles actions related to quotes. It provides endpoints for
    # reading quotes in format JSON.
    class QuotesController < Api::ApiController
      before_action :set_quote, only: %i[show]
      # GET /quotes or /quotes.json
      def index
        @quotes = Quote.ordered
      end

      # GET /quotes/1 or /quotes/1.json
      def show; end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_quote
        @quote = Quote.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def quote_params
        params.require(:quote).permit(:name)
      end
    end
  end
end
