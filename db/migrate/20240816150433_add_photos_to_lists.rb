class AddPhotosToLists < ActiveRecord::Migration[7.1]
  def change
    add_column :lists, :photos, :string
  end
end
