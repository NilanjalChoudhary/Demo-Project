class Post < ApplicationRecord
  has_one_attached :avatar
  belongs_to :user
  # belongs_to :nonpreciousian, :preciousian
end
