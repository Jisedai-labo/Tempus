class RemoveColumnsToStudytimes < ActiveRecord::Migration[5.2]
  def change
    remove_column :studytimes, :posted_at, :datetime
    remove_column :studytimes, :date, :datetime
  end
end
