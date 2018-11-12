class CreateUserMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :user_meals do |t|
      t.boolean :selected
      t.references :user, foreign_key: true
      t.references :meal, foreign_key: true

      t.timestamps
    end
  end
end
