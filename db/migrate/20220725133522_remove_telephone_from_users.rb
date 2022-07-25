class RemoveTelephoneFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :telephone 
  end
end
