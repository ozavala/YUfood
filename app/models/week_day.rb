class WeekDay < ApplicationRecord
  belongs_to :meal_plan
  has_many :week_day_meals, foreign_key: :week_day_id
  has_many :meals, through: :week_day_meals

  def prev
    WeekDay.where(["date < ?", date]).last
  end
  
  def next
    WeekDay.where(["date > ?", date]).first
  end
end
