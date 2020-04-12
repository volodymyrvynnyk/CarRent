json.extract! car, :id, :brand, :model, :description, :image_url, :price, :transmission, :seats, :body, :created_at, :updated_at
json.url car_url(car, format: :json)
