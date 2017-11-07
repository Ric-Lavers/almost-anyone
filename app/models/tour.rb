class Tour < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :user
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :bookings

  validate :start_date_cannot_be_in_the_past

 def start_date_cannot_be_in_the_past
   if start_date.present? && start_date < Date.today
     errors.add(:start_date, "Can't be in the past")
   end
 end

end
