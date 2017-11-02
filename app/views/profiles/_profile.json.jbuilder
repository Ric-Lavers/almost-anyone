json.extract! profile, :id, :user_id, :brand, :location, :phone_number, :image_data, :bio, :created_at, :updated_at
json.url profile_url(profile, format: :json)
