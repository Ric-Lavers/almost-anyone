json.extract! offer, :id, :tour_id, :user_id, :date, :price, :location, :created_at, :updated_at
json.url offer_url(offer, format: :json)
