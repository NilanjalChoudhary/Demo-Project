class Comment < ApplicationRecord

  validates :comment, presence: true

  validates :comment, length: { in: 1..100 }

  

  belongs_to :post

  # before_save do 
  #   self.commenter = current_user.name
  # end
end