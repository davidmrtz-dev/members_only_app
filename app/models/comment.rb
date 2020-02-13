class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :content, presence: true, length: { in: 1..1500 }
  validates :user, presence: true
end
