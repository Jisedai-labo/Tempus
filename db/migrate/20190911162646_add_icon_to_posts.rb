class AddIconToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :icon, :string
  end
end
