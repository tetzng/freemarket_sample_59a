crumb :root do
  link 'メルカリ', root_path
end

crumb :mypage do
  link 'マイページ', mypage_path
  parent :root
end

crumb :user_sign_out do
  link 'ログアウト'
  parent :mypage
end

crumb :mypage_identification do
  link '本人情報の確認'
  parent :mypage
end

crumb :itembuy do |item|
  link item.name, toppage_itembuy_path(item)
  parent :root
end

crumb :mypage_card do
  link '支払い方法' 
  parent :mypage
end

crumb :mypage_card_create do
  link 'クレジットカード情報入力' 
  parent :mypage_card
end

crumb :mypage_profile do
  link 'プロフィール'
  parent :mypage
end

crumb :sell_item do |q|
  link '出品した商品'
  parent :mypage
end
