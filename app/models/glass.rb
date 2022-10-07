class Glass < ApplicationRecord
  belongs_to :user
  belongs_to :frame
  belongs_to :lens
  has_many :user_carts

  validates_presence_of :user, :lens, :frame
end
