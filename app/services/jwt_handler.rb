class JwtHandler
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  # challege only, not for production
  def self.encode()
    JWT.encode("my_secret_string_to_access_endpoint", SECRET_KEY)
  end

  def self.decode(token)
    HashWithIndifferentAccess.new JWT.decode(token, SECRET_KEY)[0]
  end
end
