class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_pic, dependent: :destroy

  

end
