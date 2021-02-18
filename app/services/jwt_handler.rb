class JwtHandler
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  # challege only, not for production
  def self.encode(payload)
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    HashWithIndifferentAccess.new JWT.decode(token, SECRET_KEY)[0]
  end
end
