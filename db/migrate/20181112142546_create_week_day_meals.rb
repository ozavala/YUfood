class CreateWeekDayMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :week_day_meals do |t|
      t.references :week_day, foreign_key: true
      t.references :meal, foreign_key: true
    end
  end
end
