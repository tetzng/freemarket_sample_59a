# クレカ有効期限(年)とアソシエーション
class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :paymentyear
end
