class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :omniauthable, omniauth_providers: [ :facebook, :google_oauth2 ] 
  belongs_to :user
  has_many :shopping_origin_addresses
  has_many :products


  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :birth_yyyy
    belongs_to_active_hash :birth_mm
    belongs_to_active_hash :birth_dd
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :paymentyear
    belongs_to_active_hash :paymentmonth   

  belongs_to :user
  has_many :shopping_origin_addresses
  has_many :products
  has_one :card
  

  # has_many :shopping_origin_addresses
  # has_many :products
  # has_many :puchases
  # has_many :comments
  # has_one_attached :avatar
  # has_many :likes, through: :like_users

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,128}\z/i
  VALID_POSTAL_CODE = /\A\d{3}-\d{4}\z/i

  #registration
  validates :nickname, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: 'のフォーマットが不適切です'}
  validates :password, presence: true, length: { in: 7..128 }, format: { with: VALID_PASSWORD_REGEX, message: 'は英字と数字両方を含むパスワードを設定してください'}
  validates :password_confirmation, presence: true, length: { in: 7..128 }, format: { with: VALID_PASSWORD_REGEX, message: 'は英字と数字両方を含むパスワードを設定してください'}
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
  validates :authentication_num, presence: true, numericality: { only_integer: true }

  #signup/address
  validates :last_name, presence: true, length: { maximum: 35 }
  validates :first_name, presence: true, length: { maximum: 35 }
  validates :last_name_kana, presence: true, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}
  validates :first_name_kana, presence: true, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}
  validates :zip_code1, presence: true, length: { maximum: 8 }, format: { with: VALID_POSTAL_CODE, message: 'のフォーマットが不適切です' }
  validates :prefecture_id, presence: true, numericality: { only_integer: true, less_than: 49 }
  validates :city, presence: true, length: { maximum: 50 }
  validates :address1, presence: true, length: { maximum: 100 }
  validates :address2, length: { maximum: 100 }
  validates :telephone, length: { maximum: 8 }


  def self.find_for_oauth(auth)
    user = User.where(nickname: auth.extra.raw_info.name, email: auth.info.email).first
    
    unless user
      user = User.create( nickname: auth.extra.raw_info.name,
                          provider: auth.provider,
                          uid:      auth.uid,
                          email:    auth.info.email,
                          token:    auth.credentials.token,
                          password: Devise.friendly_token[0,20] )
    end
  
    return user
  end



  #signup/credit_card
  validates :payment_card_no, presence: true, length: { maximum: 16 }, numericality: { only_integer: true }
  validates :paymentmonth_id, presence: true
  validates :paymentyear_id, presence: true
  validates :payment_card_security_code, presence: true, length: { maximum: 4 }, numericality: { only_integer: true }

  def full_name
    "#{self.last_name} #{self.first_name}"
  end

  def full_name_kana
    "#{self.last_name_kana} #{self.first_name_kana}"
  end

  # yyyy/mm/dd の形式で表示
  def birthday
    "#{BirthYyyy.find(self.birth_yyyy_id).year}/#{BirthMm.find(self.birth_mm_id).month}/#{BirthDd.find(self.birth_dd_id).day}"
  end
end