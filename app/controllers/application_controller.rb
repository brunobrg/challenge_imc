class ApplicationController < ActionController::API
  before_action :authorize

  SECRETS = [
    "rhsoftware_ruby_backend_challenge"
  ]

  # Challenge only, do not apply this to production
  # Decoded secret =>  eyJhbGciOiJIUzI1NiJ9.InJoc29mdHdhcmVfcnVieV9iYWNrZW5kX2NoYWxsZW5nZSI.NbCI-Nyvhf9ppDoBwJmKzHprvfarCGgDsG6H1JrL4bA

  def authorize
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JwtHandler.decode(header)
      @allowed = SECRETS.include? @decoded
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
