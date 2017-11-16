class Message < ApplicationRecord
  belongs_to :tour
  belongs_to :offer
  belongs_to :user
end
