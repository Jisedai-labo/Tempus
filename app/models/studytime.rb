class Studytime < ApplicationRecord
  belongs_to :post
  validates :post_id, uniqueness: true
end
