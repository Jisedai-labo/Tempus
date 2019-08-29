class DropStudytimesAndAddStudytimesToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :studytime, :integer
  end
end
