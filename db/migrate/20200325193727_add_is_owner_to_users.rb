class AddIsOwnerToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_owner, :boolean
  end
end
