class User < ApplicationRecord


  def self.ransackable_associations(auth_object = nil)
    []
  end

  # ransacker :votes_id_eq, formatter: proc { nil } do
  #   Arel.sql("1") # Return a condition that always evaluates to true to prevent searching
  # end

  def self.ransackable_attributes(auth_object = nil)
    ["age", "confirm_by_admin", "confirmation_sent_at", "confirmation_token", "confirmed_at", "created_at", "email", "encrypted_password", "id", "name", "phone_number", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "unconfirmed_email", "updated_at", "year_of_experience"]
  end
  


  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to "users" }

  # validates :phone_number, inclusion: { in: 0..9 }
  validates :age, numericality: true
  validates :phone_number, numericality: true, length: { maximum: 13 }
  validates :name, presence: true
  validates :age, presence: true
  validates :year_of_experience, presence: true


  acts_as_voter

  has_one :profile, dependent: :destroy

  has_many :messages, dependent: :destroy

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