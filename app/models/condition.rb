class Condition < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: '新品、未使用' },
      { id: 2, value: '未使用に近い' },
      { id: 3, value: '目立った傷や汚れなし' },
      { id: 4, value: 'やや傷や汚れあり' },
      { id: 5, value: '傷や汚れあり' },
      { id: 6, value: '全体的に状態が悪い' }
  ]
end
