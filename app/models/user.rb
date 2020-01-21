class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  before_save :downcase_email
  validates :name, presence: true, length: { maximum: 60 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  private

  def downcase_email
    email.downcase!
  end
end
