class Post < ApplicationRecord
  belongs_to :user
  validates :language, presence: true
  validates :content, length: {maximum: 140}
  validates :user_id, presence: true
end
