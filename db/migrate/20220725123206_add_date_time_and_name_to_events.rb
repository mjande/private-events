class AddDateTimeAndNameToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :name, :string
    add_column :events, :date, :date
    add_column :events, :time, :time
  end
end
