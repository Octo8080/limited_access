class AddCloumnsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :password, :string
    add_column :events, :status, :inteager, default: 0
    add_column :events, :photo, :string
  end
end
