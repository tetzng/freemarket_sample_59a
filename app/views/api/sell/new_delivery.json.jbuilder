json.array! @delivery_ways do |deliveryWay|
  json.id deliveryWay.id
  json.value deliveryWay.value
  json.charge deliveryWay.charge
end
