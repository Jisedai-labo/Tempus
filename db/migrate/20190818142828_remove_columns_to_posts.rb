class RemoveColumnsToPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :studytime, :integer
    remove_column :posts, :posted_at, :datetime
    remove_column :posts, :date, :date
  end
end
