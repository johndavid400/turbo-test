module Api
  module V1
    class AuthController < ApiController

      def create
        # lookup user
        user = User.find_by(email: params[:email])
        if user.present?
          # if user is present, go on to check password
          if user.valid_password?(params[:password])
            # if password is valid, go on to create token
            # payload can be whatever you want to include:
            payload = {
              sub: user.id,
              email: user.email
            }
            # generate JWT
            @jwt = JWT.encode(payload, HMAC_SECRET, 'HS256')
            render json: {token: @jwt}
          else
            # password is invalid
            render json: {error: 'Password incorrect'}, status: :unauthorized
          end
        else
          # user not found
          render json: {error: 'User not found'}, status: :unauthorized
        end
      end

    end
  end
end
