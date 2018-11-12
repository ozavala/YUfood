class ShoppingList < ApplicationRecord
  belongs_to :meal_plan
  has_many :list_items
end
