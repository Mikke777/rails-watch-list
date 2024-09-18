class AddUserToLists < ActiveRecord::Migration[7.1]
  def change
    add_reference :lists, :user, null: true, foreign_key: true

    # Backfill user_id for existing records (adjust based on your logic)
    List.reset_column_information
    List.update_all(user_id: User.first.id) # Assign to the first user or a default user

    # Then, make it not nullable after backfilling
    change_column_null :lists, :user_id, false
  end
end
