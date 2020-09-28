module Users
  class Activate < ApplicationService
    def initialize(user)
      @user = user
    end

    def call
      @user.update(activated: true)
    end
  end
end
