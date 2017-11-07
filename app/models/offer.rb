class Offer < ApplicationRecord
  belongs_to :tour
  belongs_to :user

  validate :date_must_in_range, :price_must_in_above_min_cost

 def date_must_in_range
   if date <= tour.start_date && date >= tour.end_date
     errors.add(:date, "Outside of date range")
   end
 end

 def price_must_in_above_min_cost
   if price < tour.min_cost
     errors.add(:price, "is outside of cost range")
   end
 end

end
