class Post < ApplicationRecord
  acts_as_votable

  # has_one_attached :image
  has_many_attached :pictures
  has_rich_text :body
  has_many :comments, dependent: :destroy
  belongs_to :user

  
  validates :title, presence: true
  # belongs_to :nonpreciousian, :preciousian
end