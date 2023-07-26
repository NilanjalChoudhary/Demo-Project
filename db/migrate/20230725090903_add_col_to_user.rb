class AddColToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :confirm_by_admin, :boolean, default: false
  end
end
