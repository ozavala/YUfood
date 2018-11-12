class AddEatenToWeekDayMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :week_day_meals, :eaten, :boolean
  end
end
