class ChangeColumnsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :language_id, :integer
    add_index :posts, :language_id
    remove_column :posts, :language, :string
    remove_column :posts, :icon, :string
  end
end
