class AddPhotosToLists < ActiveRecord::Migration[7.1]
  def change
    add_column :lists, :photo, :file
  end
end
