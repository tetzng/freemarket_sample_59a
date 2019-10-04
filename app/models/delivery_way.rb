class DeliveryWay < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      # 送料込み選択時
      { id: 1, value: '未定', charge: '1' },
      { id: 2, value: 'らくらくメルカリ便', charge: '1' },
      { id: 3, value: 'ゆうメール', charge: '1' },
      { id: 4, value: 'レターパック', charge: '1' },
      { id: 5, value: '普通郵便(定形、定形外)', charge: '1' },
      { id: 6, value: 'クロネコヤマト', charge: '1' },
      { id: 7, value: 'ゆうパック', charge: '1' },
      { id: 8, value: 'クリックポスト', charge: '1' },
      { id: 9, value: 'ゆうパケット', charge: '1' },

      # 着払い選択時
      { id: 10, value: '未定', charge: '2' },
      { id: 11, value: 'クロネコヤマト', charge: '2' },
      { id: 12, value: 'ゆうパック', charge: '2' },
      { id: 13, value: 'ゆうメール', charge: '2' }
  ]
end
