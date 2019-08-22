class AddDateAndIndex < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :date, :date
    add_index :posts, :date
  end
end
