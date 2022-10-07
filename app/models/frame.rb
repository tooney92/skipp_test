class Frame < ApplicationRecord
  validates_presence_of :name, :description, :status, :stock, :price


  enum status: %i[in_active active]
  def convert_from_cents
    price * 100
  end
end
