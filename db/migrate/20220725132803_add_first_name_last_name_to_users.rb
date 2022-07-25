class AddFirstNameLastNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :last_name, :string
    change_column :users, :name, :first_name
  end
end
