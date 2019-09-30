class DeliveryWay < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: '未定', charge: '1' },
      { id: 2, value: 'らくらくメルカリ便', charge: '0' },
      { id: 3, value: 'ゆうメール', charge: '1' },
      { id: 4, value: 'レターパック', charge: '0' },
      { id: 5, value: '普通郵便(定形、定形外)', charge: '0' },
      { id: 6, value: 'クロネコヤマト', charge: '1' },
      { id: 7, value: 'ゆうパック', charge: '1' },
      { id: 8, value: 'クリックポスト', charge: '0' },
      { id: 9, value: 'ゆうパケット', charge: '0' }
  ]
end
