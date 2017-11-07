class Booking < ApplicationRecord
  belongs_to :tour

  validate :date_must_in_range

 def date_must_in_range
   puts "+"*25
   puts "tour.start_date: #{tour.start_date.to_date}".red
   puts "date: #{date}".red
   puts "+"*25
   if date < tour.start_date.to_date || date > tour.end_date.to_date
     errors.add(:date, "Outside of date range")
   end
 end

end
