class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :description
      t.string :website
      t.string :phonenumber
      t.string :imageurl
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
