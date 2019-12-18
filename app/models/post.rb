class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :content, presence: true, length: { maximum: 200 }
  validates :user_id, presence: true
end
