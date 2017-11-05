json.extract! tour, :id, :user_id, :title, :description, :country, :image_data, :bio, :start_date, :end_date, :min_cost, :max_cost, :created_at, :updated_at
json.url tour_url(tour, format: :json)
