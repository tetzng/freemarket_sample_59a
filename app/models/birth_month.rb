# 生年月日の(月)とアソシエーション
class BirthMonth < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :birth_mm
end
