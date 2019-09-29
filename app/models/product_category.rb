class Product  < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
    { id: 1, name: '19' },
    { id: 2, name: '20' },
    { id: 3, name: '21' },
    { id: 4, name: '22' },
    { id: 5, name: '23' },
    { id: 6, name: '24' },
    { id: 7, name: '25' },
    { id: 8, name: '26' },
    { id: 9, name: '27' },
    { id: 10, name: '28' },
    { id: 11, name: '29' },
  ]
end
