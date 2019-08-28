class Studytime < ApplicationRecord
  belongs_to :post
  validates :post_id, uniqueness: true
  validates :studytime, presence: true, :numericality => {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 600000}
end
