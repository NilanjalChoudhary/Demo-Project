class AddColumnToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :integer
    add_column :users, :age, :integer
    add_column :users, :year_of_experience, :integer
  end
end
