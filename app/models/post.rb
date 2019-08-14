class Post < ApplicationRecord
  validates :language, presence: true
  belongs_to :users
end
