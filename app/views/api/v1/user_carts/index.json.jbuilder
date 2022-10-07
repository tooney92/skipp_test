json.glasses @cart do |cart|
  json.frame_name cart.glass.frame.name
  json.frame_description cart.glass.frame.description
  json.frame_price  number_with_precision(
                      @converter.convert_from_euro(@user_currency, cart.glass.frame.price*100).to_f, precision: 2).to_f
  json.lens_description cart.glass.lens.description
  json.lens_prescription cart.glass.lens.prescription_type
  json.lens_price  number_with_precision(
                     @converter.convert_from_euro(@user_currency, cart.glass.lens.price*100).to_f, precision: 2).to_f
  json.lens_color cart.glass.lens.color
  json.lens_type cart.glass.lens.lens_type


end