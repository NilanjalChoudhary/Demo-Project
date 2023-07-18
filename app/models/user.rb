class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  # enum :role, [:NonPreciousian, :Preciousian, :Admin]
  enum role: {NonPreciousian: 0, Preciousian: 1, Admin: 2}

  validates :role, inclusion: {in:roles.keys}
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
end