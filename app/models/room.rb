class Room < ApplicationRecord
  scope :public_rooms, -> { where(is_private: false) }
end
