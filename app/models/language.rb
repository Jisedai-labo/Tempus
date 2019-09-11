class Language < ApplicationRecord
  validates :language, uniqueness: true, presence: true
end
