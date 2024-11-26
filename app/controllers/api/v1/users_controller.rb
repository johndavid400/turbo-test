module Api
  module V1
    class UsersController < ::Api::ApiController
      before_action :set_user, only: %i[ show ]

      # GET /quotes or /quotes.json
      def index
        @users = User.all
        render json: @users
      end

      # GET /quotes/1 or /quotes/1.json
      def show
        render json: @user
      end

      private
        # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
