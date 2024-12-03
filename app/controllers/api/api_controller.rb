module Api
  #class ApiController < ::ActionController::API
  class ApiController < ApplicationController
    before_action :authenticate_user

    private

    def authenticate_user
      # render status: :unauthorized, json: { error: "token." }

      authenticate_or_request_with_http_token do |token, options|
        #ActiveSupport::SecurityUtils.secure_compare(token, TOKEN)
        return false if token.blank?
        return true if ApiKey.exists?(token: token)

        false
      end
    end
  end
end

