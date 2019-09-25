class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :user
  has_many :shopping_origin_addresses
  has_many :products
  has_many :puchases
  has_many :comments
  has_one_attached :avatar
  has_many :likes, through: :like_users

  validates :id, presence: true, length: { maximum: 20 }
  validates :e_mail, presence: true, /^\S+@\S+\.\S+$/
  validates :encrypted_password, presence: true, length: { in: 7..128 },
end

