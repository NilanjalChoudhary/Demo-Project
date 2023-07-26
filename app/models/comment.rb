class Comment < ApplicationRecord
  belongs_to :post

  # before_save do 
  #   self.commenter = current_user.name
  # end
end