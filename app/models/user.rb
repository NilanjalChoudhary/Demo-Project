class User < ApplicationRecord

  scope :all_except, ->(user) { where.not(id: user) }


  acts_as_voter

  has_one :profile, dependent: :destroy

  acts_as_follower
  acts_as_followable

  has_many :posts, dependent: :destroy

  has_many :contacts, dependent: :destroy 
  # enum :role, [:NonPreciousian, :Preciousian, :Admin]
  enum role: {NonPreciousian: 0, Preciousian: 1, Admin: 2}

  validates :role, inclusion: {in:roles.keys}

  validates :name, uniqueness: true
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  def unfollow(user)
    follows.where(followable_id: user.id).destroy_all
  end

end