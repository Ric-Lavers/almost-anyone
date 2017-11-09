class Booking < ApplicationRecord
  belongs_to :tour

  validate :date_must_in_range, :date_is_in_past
  validates :date, :presence => true, :uniqueness => true

  def date_is_in_past
    if date < Date.today
      errors.add(:date, " is in past")
    end
  end

 def date_must_in_range
   if date < tour.start_date.to_date || date > tour.end_date.to_date
     errors.add(:date, "Outside of date range")
   end
 end


end
