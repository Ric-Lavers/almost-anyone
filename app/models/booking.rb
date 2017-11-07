class Booking < ApplicationRecord
  belongs_to :tour

  validate :date_must_in_range
  validates :date, :presence => true, :uniqueness => true


 def date_must_in_range
   if date < tour.start_date.to_date || date > tour.end_date.to_date
     errors.add(:date, "Outside of date range")
   end
 end


end
