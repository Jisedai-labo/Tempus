class Language < ApplicationRecord
  has_many :posts
  validates :language, uniqueness: true, presence: true
  validates :icon, uniqueness: true, presence: true
end
