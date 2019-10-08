class DeliveryCharge < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: '送料込み(出品者負担)' },
      { id: 2, value: '着払い(購入者負担)' }
  ]
end
