json.lenses @lenses do |lens|
  json.id lens.id
  json.color lens.color
  json.description lens.description
  json.prescription_type lens.prescription_type
  json.lens_type lens.lens_type
  json.stock lens.stock
  json.price number_with_precision(@converter.convert_from_euro(@user_currency, lens.convert_from_cents).to_f, precision: 2).to_f
end
