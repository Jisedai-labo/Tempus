class Post < ApplicationRecord
  belongs_to :user
  validates :language, presence: true
  validates :content, length: {maximum: 140}
  validates :user_id, presence: true
  validates :studytime, presence: true, :numericality => {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 600000}
end
