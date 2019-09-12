class Language < ApplicationRecord
  validates :language, uniqueness: true, presence: true
  validates :icon, uniqueness: true, presence: true
end
