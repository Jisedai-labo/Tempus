class Post < ApplicationRecord
  belongs_to :user
  has_one :studytime, dependent: :destroy
  #accepts_nested_attributes_for :studytime
  validates :language, presence: true
  validates :content, length: {maximum: 140}
  validates :user_id, presence: true
end
