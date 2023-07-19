class Post < ApplicationRecord
  has_one_attached :image
  has_many_attached :pictures
  has_rich_text :body
  belongs_to :user

  validates :title, presence: true
  # belongs_to :nonpreciousian, :preciousian
end
