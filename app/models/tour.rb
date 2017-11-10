class Tour < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :user
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :bookings
  is_impressionable
  validate :start_date_cannot_be_in_the_past, :headline_length


 def start_date_cannot_be_in_the_past
   if start_date.present? && start_date < Date.today
     errors.add(:start_date, "Can't be in the past")
   end
 end

 def headline_length
   if description.length > 30
     errors.add(:description, "has a 30 character max, its more of a headline")
   end
 end

 def self.search(search)
  where("title ILIKE ? OR description ILIKE ? OR bio ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
end

end
