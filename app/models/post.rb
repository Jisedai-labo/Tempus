class Post < ApplicationRecord
  validates :language, presence: true
  belongs_to :user
end
