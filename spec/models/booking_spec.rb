require 'rails_helper'

RSpec.describe Booking, type: :model do


    it "is valid in past" do
      booking = Booking.create! date: Date.new(2005,12,12)
      x=true if booking.save!
      expect(x).to be_success
    end

end
