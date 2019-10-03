class Size < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: 'XXS以下', group: '1' },
      { id: 2, value: 'XS(SS)', group: '1' },
      { id: 3, value: 'S', group: '1' },
      { id: 4, value: 'M', group: '1' },
      { id: 5, value: 'L', group: '1' },
      { id: 6, value: 'XL(LL)', group: '1' },
      { id: 7, value: '2XL(3L)', group: '1' },
      { id: 8, value: '3XL(4L)', group: '1' },
      { id: 9, value: '4XL(5L)以上', group: '1' },
      { id: 10, value: 'FREE SIZE', group: '1' },
      { id: 11, value: '20cm以下', group: '2' },
      { id: 12, value: '20.5cm', group: '2' },
      { id: 13, value: '21cm', group: '2' },
      { id: 14, value: '21.5cm', group: '2' },
      { id: 15, value: '22cm', group: '2' },
      { id: 16, value: '22.5cm', group: '2' },
      { id: 17, value: '23cm', group: '2' },
      { id: 18, value: '23.5cm', group: '2' },
      { id: 19, value: '24cm', group: '2' },
      { id: 20, value: '24.5cm', group: '2' },
      { id: 21, value: '25cm', group: '2' },
      { id: 22, value: '25.5cm', group: '2' },
      { id: 23, value: '26cm', group: '2' },
      { id: 24, value: '26.5cm', group: '2' },
      { id: 25, value: '27cm', group: '2' },
      { id: 26, value: '27.5cm以上', group: '2' },
      { id: 99, value: '', group: '' }
  ]
end

