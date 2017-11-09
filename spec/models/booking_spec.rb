require 'rails_helper'

RSpec.describe Booking, type: :model do


    it "is valid in past" do
      user = User.create!(email: "a@a.com", password: "11111111", encrypted_password: "11111111")
      tour = Tour.create!(title: "hi", description: "hi", user_id: user.id, start_date: Date.new(2018,12,12), end_date: Date.new(2020,12,12))
      booking = Booking.new(date: Date.new(2005,12,12), tour_id: tour.id)
      outside_of_range_errors = false
      if booking.save!
        outside_of_range_errors = true
      end
      expect(outside_of_range_errors).to be_false
    end

end
