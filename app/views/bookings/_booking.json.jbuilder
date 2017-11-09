json.extract! booking, :id, :tour_id, :date, :created_at, :updated_at
json.url booking_url(booking, format: :json)
