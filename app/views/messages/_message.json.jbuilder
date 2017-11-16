json.extract! message, :id, :tour_id, :offer_id, :user_id, :message, :time, :read, :created_at, :updated_at
json.url message_url(message, format: :json)
