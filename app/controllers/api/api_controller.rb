module Api
  class ApiController < ActionController::API
    before_action :authenticate_user

    private

    def authenticate_user
      render status: :unauthorized, json: { error: 'You are not authorized to access this resource. Verify that you are passing passing your token.'}
    end
  end
end
