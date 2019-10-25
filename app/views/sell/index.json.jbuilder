# json.array! @sub_categories do |category|
#   json.id category.id
#   json.name category.name
#   json.sub category.sub
#   json.sub_sub category.sub_sub
# end

# json.sub @sub_categories.sub
# json.sub @sub_sub_categories.sub
# json.sub_sub @sub_sub_categories.sub_sub

# json.array! @sub_sub_categories do |category|
#   json.id category.id
#   json.name category.name
#   json.sub category.sub
#   json.sub_sub category.sub_sub
# end