class WeekDayMeal < ApplicationRecord
  belongs_to :week_day
  belongs_to :meal
end
