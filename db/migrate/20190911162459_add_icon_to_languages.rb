class AddIconToLanguages < ActiveRecord::Migration[5.2]
  def change
    add_column :languages, :icon, :string
  end
end
