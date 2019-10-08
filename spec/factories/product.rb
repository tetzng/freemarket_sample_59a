FactoryBot.define do
  factory :product do
    after(:create) do |product|
    create(:attachment, name: 'image', record_type: 'product', record_id: product.id)
    end
    id {4}
    user_id {1}
    name {"スカート"}
    description {"2019年秋の新作"}
    category_id {212}
    condition_id {1}
    size_id {1}
    brand {"ユニクロ"}
    delivery_charge_id {1}
    delivery_way_id {1}
    prefecture_id {1}
    delivery_days_id {1}
    price {"3000"}
    status_id {1}
    association :user, factory: :user
    
  end
end