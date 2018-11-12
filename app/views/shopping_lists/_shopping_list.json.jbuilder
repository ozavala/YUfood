json.extract! shopping_list, :id, :meal_plan_id, :created_at, :updated_at, :list_items
json.url shopping_list_url(shopping_list, format: :json)
