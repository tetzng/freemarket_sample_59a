class DeliveryDays < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: '1~2日で発送' },
      { id: 2, value: '2~3日で発送' },
      { id: 3, value: '4~7日で発送' }
  ]
end