class Lens < ApplicationRecord
  validates_presence_of :color, :description, :price, :stock, :lens_type, :prescription_type

  enum prescription_type: %i[fashion single_vision varifocals]
  enum lens_type: %i[classic blue_light transition]

  def convert_from_cents
    price * 100
  end
end
