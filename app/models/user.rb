class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  before_save :downcase_email
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 60 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  class << self
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def authenticated?(remember_token)
    return false if remember_token.nil?
  end

  def forget
    update_attribute(:remember_token, nil)
  end

  private

  def downcase_email
    email.downcase!
  end

  def create_remember_token
    self.remember_token = User.new_token
  end
end
