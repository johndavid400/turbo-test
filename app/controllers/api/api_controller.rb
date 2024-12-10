module Api
  class ApiController < ApplicationController
    before_action :authenticate_user

    private

    def authenticate_user
      authenticate_with_http_token do |token, options|
        return unauthorized if token.blank?

        api_key = ApiKey.find_by(token: token)
        return unauthorized unless api_key.present?

        @current_user = api_key.user
      end
    end

    def unauthorized
      render status: :unauthorized, json: { error: "Unauthorized." }
    end
  end
end

