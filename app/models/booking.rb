class Booking < ApplicationRecord
  belongs_to :tour
  has_one :user
  has_many :user, through :tour
end
