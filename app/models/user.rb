class User < ApplicationRecord
  before_validation :downcase_email

  has_secure_password

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A[\w\d]+@[\w\d]+\.[\w]+/ }

  private

  def downcase_email
    self.email = email.downcase
  end
end
