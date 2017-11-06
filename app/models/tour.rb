class Tour < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :user
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :bookings
end
