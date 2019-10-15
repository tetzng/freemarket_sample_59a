json.array! @categories do |category|
  json.id category.id
  json.name category.name
  json.sub category.sub
  json.sub_sub category.sub_sub
end

json.array! @sub_sub_categories do |sub_category|
  json.id sub_category.id
  json.name sub_category.name
  json.sub sub_category.sub
  json.sub_sub sub_category.sub_sub
end