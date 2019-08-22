class KyouzaiAndTimes < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :kyouzai, :string
    add_column :posts, :posted_at, :datetime
    add_column :posts, :studytime, :integer
  end
end
