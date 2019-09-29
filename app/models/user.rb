class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :birth_yyyy
    belongs_to_active_hash :birth_mm
    belongs_to_active_hash :birth_dd
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :paymentyear
    belongs_to_active_hash :paymentmonth

  # has_many :shopping_origin_addresses
  # has_many :products
  # has_many :puchases
  # has_many :comments
  # has_one_attached :avatar
  # has_many :likes, through: :like_users

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i

#registration
  validates :nickname, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX , message: 'のフォーマットが不適切です'}
  validates :password, presence: true, length: { in: 7..128 }, format: { with: VALID_PASSWORD_REGEX , message: 'は英字と数字両方を含むパスワードを設定してください'}
  validates :password_confirmation, presence: true, length: { in: 7..128 }, format: { with: VALID_PASSWORD_REGEX , message: 'は英字と数字両方を含むパスワードを設定してください'}
  validates :last_name, presence: true, length: { maximum: 35 }
  validates :first_name, presence: true, length: { maximum: 35 }
  validates :last_name_kana, presence: true, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}
  validates :first_name_kana, presence: true, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}
  validates :birth_yyyy_id, presence: true
  validates :birth_mm_id, presence: true
  validates :birth_dd_id, presence: true

#sms_confirmation
  validates :phone_num, presence: true, format: { with: /\A\d{10,11}\z/, message: 'の入力が正しくありません'}

#sms_confirmation/sms
  validates :authentication_num, presence: true,numericality: { only_integer: true }
#signup/address
  validates :last_name, presence: true, length: { maximum: 35 }
  validates :first_name, presence: true, length: { maximum: 35 }
  validates :last_name_kana, presence: true, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}
  validates :first_name_kana, presence: true, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}
  validates :zip_code1, presence: true, length: { maximum: 35 }



  session[:zip_code1] = user_params[:zip_code1]
  session[:prefecture_id] = user_params[:prefecture_id]
  session[:city] = user_params[:city]
  session[:address1] = user_params[:address1]
  session[:address2] = user_params[:address2]
  session[:telephone] = user_params[:telephone]


end

