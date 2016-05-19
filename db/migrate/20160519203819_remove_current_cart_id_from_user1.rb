class RemoveCurrentCartIdFromUser1 < ActiveRecord::Migration
  def change
    remove_column :users, :current_cart_id
  end
end
