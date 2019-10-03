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
  belongs_to :card
end
