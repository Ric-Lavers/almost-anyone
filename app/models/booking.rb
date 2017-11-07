class Booking < ApplicationRecord
  belongs_to :tour
  has_one :user

  validate :date_must_in_range#, :price_must_in_above_min_cost

 def date_must_in_range
   puts "#{tour}".red
   puts "#{params}".red
   if date >= tour.start_date && date <= tour.end_date
     errors.add(:date, "Outside of date range")
   end
 end

 def price_must_in_above_min_cost
   if price < tour.min_cost
     errors.add(:date, "Outside of cost range")
   end
 end
end
