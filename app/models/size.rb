class Size < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: 'XXS以下' },
      { id: 2, value: 'XS(SS)' },
      { id: 3, value: 'S' },
      { id: 4, value: 'M' },
      { id: 5, value: 'L' },
      { id: 6, value: 'XL(LL)' },
      { id: 7, value: '2XL(3L)' },
      { id: 8, value: '3XL(4L)' },
      { id: 9, value: '4XL(5L)以上' },
      { id: 10, value: 'FREE SIZE' }
  ]
end

# <option value="144">20cm以下</option>
# <option value="145">20.5cm</option>
# <option value="146">21cm</option>
# <option value="147">21.5cm</option>
# <option value="148">22cm</option>
# <option value="16">22.5cm</option>
# <option value="17">23cm</option>
# <option value="18">23.5cm</option>
# <option value="19">24cm</option>
# <option value="20">24.5cm</option>
# <option value="21">25cm</option>
# <option value="22">25.5cm</option>
# <option value="149">26cm</option>
# <option value="150">26.5cm</option>
# <option value="151">27cm</option>
# <option value="152">27.5cm以上</option>
