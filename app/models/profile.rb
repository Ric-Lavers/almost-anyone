class Profile < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :user
  has_and_belongs_to_many :genres
  scoped_search on: [:brand]
end
