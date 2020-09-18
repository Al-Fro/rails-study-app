module Users
  class ActivationCode
    SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

    def self.encode(code)
      JWT.encode({ activation_code: code }, SECRET_KEY)
    end
    
    def self.decode(payload)
      JWT.decode(payload, SECRET_KEY).first['activation_code']
    end
  end
end

