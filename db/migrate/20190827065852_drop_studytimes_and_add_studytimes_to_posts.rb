class DropStudytimesAndAddStudytimesToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :studytime, :integer
    drop_table :studytimes
  end
end
