module Users
  class Activate < ApplicationService
    def initialize(user)
      @user = user
    end

    def call
      @user.update_columns(activated: true)
    end
  end
end

