class RemoveCurrentCartIdFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :caurrent_cart_id
  end
end
