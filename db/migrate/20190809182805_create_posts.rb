class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :language
      t.integer :user_id

      t.timestamps
      
    end
    add_index :posts, [:id, :user_id]
  end
end
