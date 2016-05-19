class AddUseridToCart < ActiveRecord::Migration
  def change
    change_table :carts do |t|
      t.integer  :user_id
      t.integer :status, default: "not submitted"
    end
  end
end
