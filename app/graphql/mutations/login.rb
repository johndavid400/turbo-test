module Mutations
  class Login < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :token, String, null: false

    def resolve(email:, password:)
      raise GraphQL::ExecutionError, "User already signed in" if context[:current_user_from_token]

      user = User.find_for_authentication(email: email)

      if user&.valid_password?(password)
        token = JWT.encode({ user_id: user.id, exp: 20.minutes.from_now.to_i }, 'serllessecretcode', 'HS256')
        { token: token }
      else
        raise GraphQL::ExecutionError, 'Invalid email or password'
      end
    end
  end
end