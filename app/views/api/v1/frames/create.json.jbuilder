json.frame do
  json.id @frame.id
  json.name @frame.name
  json.description @frame.description
  json.status @frame.status
  json.stock @frame.stock
  json.price @frame.price.to_f
end
