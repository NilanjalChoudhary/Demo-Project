class AddColumnToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :username, :string
    add_column :profiles, :age, :integer
    add_column :profiles, :phone_number, :integer
    add_column :profiles, :email, :string
  end
end
