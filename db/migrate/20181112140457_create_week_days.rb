class CreateWeekDays < ActiveRecord::Migration[5.2]
  def change
    create_table :week_days do |t|
      t.date :date
      t.boolean :eaten
      t.references :meal, foreign_key: true

      t.timestamps
    end
  end
end
