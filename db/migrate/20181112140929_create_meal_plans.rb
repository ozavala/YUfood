class CreateMealPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_plans do |t|
      t.decimal :budget
      t.references :week_day, foreign_key: true

      t.timestamps
    end
  end
end
