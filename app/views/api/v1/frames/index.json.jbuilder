json.frames @frames do |frame|
  json.id frame.id
  json.name frame.name
  json.description frame.description
  json.status frame.status
  json.stock frame.stock
  json.price number_with_precision(
               @converter.convert_from_euro(@user_currency, frame.convert_from_cents).to_f, precision: 2).to_f
end
