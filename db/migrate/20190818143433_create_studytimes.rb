class CreateStudytimes < ActiveRecord::Migration[5.2]
  def change
    create_table :studytimes do |t|
      t.integer :studytime
      t.datetime :posted_at
      t.date :date
      t.integer :post_id

      t.timestamps
    end
    add_index :studytimes, :post_id, unique: true
  end
end
