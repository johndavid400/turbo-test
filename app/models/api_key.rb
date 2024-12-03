class ApiKey < ApplicationRecord
  has_secure_token :token, length: 24
  has_secure_token :secret, length: 36

  scope :available, -> { where(deleted_at: nil) }
end
