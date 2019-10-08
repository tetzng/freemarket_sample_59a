FactoryBot.define do
    factory :attachment, class: ActiveStorage::Attachment do
        name 'image'
        record_type 'product'
        record_id 0
        association :blob, factory: :blob
    end
end