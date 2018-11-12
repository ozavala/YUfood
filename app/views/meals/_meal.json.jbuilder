json.extract! meal, :id, :name, :description, :created_at, :updated_at, :ingredients
json.url meal_url(meal, format: :json)
