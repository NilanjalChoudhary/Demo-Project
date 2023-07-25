class AddColuToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :post_for, :string, default: "Preciousian"
  end
end