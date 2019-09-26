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
  validates :email, presence: true
  validates :encrypted_password, presence: true, length: { in: 7..128 },
  numericality: { only_integer: true }

  validates :first_name, presence: true, length: { maximum: 35 }
  validates :last_name, presence: true, length: { maximum: 35 }
  validates :first_name_kana, presence: true, length: { maximum: 35 }, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :last_name_kana, presence: true, length: { maximum: 35 }, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :birthday_year, presence: true
  validates :birthday_month, presence: true
  validates :birthday_day, presence: true
  validates :phone_num, presence: true,numericality: { only_integer: true }
  validates :authentication_num, presence: true,numericality: { only_integer: true }

end

