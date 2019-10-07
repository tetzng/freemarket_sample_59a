class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :size
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_days
  belongs_to_active_hash :delivery_way
  belongs_to_active_hash :status
  has_many_attached :images
  belongs_to :user

  validates :images, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_days_id, presence: true
  validates :price, presence: true, inclusion: 300..9999999

  def jpy
    "¥#{self.price.to_s(:delimited, delimiter: ',')}"
  end
 end
