class UserCart < ApplicationRecord
  belongs_to :glass
  belongs_to :user
  validates_presence_of :user, :glass
end
