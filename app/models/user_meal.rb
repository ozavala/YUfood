class UserMeal < ApplicationRecord
  #validates_uniqueness_of :meal_id, scope: :meal_id
  belongs_to :user
  belongs_to :meal
end
