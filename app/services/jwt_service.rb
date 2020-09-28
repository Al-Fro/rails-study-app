class JwtService
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  def self.encode(key, value)
    JWT.encode({ key => value }, SECRET_KEY)
  end

  def self.decode(key, payload)
    JWT.decode(payload, SECRET_KEY).first[key]
  end
end
