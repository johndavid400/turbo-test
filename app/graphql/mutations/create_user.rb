class Mutations::CreateUser < Mutations::BaseMutation
  argument :email, String, required: true
  argument :encrypted_password, String, required: true

  field :user, Types::UserType, null: false
  field :errors, [String], null: false

  def resolve(email:, encrypted_password:)
    user = User.new(email: email, password: encrypted_password)
    if user.save
      { user: user, errors: [] }
    else
      Rails.logger.debug "User errors: #{user.errors.full_messages}"
      { user: nil, errors: user.errors.full_messages }
    end
  end
end
