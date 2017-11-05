class Genre < ApplicationRecord
  has_one :profile
  has_one :tour
end
