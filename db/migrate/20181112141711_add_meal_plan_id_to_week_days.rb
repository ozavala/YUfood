class AddMealPlanIdToWeekDays < ActiveRecord::Migration[5.2]
  def change
    add_reference :week_days, :meal_plan, foreign_key: true
  end
end
