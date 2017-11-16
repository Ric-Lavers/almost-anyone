class Offer < ApplicationRecord
  belongs_to :tour
  belongs_to :user
  has_many :messages

  validate :date_must_in_range, :price_must_in_above_min_cost,:date_must_not_be_booked

 def date_must_in_range
   if date <= tour.start_date && date >= tour.end_date
     errors.add(:date, "is outside of date range")
   end
 end

 def date_must_not_be_booked
   bookings =Booking.where(tour_id: tour.id)
   bookings.each{|i|
     puts "#{i.date}".red
     if date == i.date
       errors.add(:date, " is not avaiable")
     end
   }
 end

 def price_must_in_above_min_cost
   if price < tour.min_cost
     errors.add(:price, "is outside of cost range")
   end
 end

end
