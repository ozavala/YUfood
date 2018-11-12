class CreateListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :list_items do |t|
      t.string :item
      t.float :amount
      t.string :amount_type
      t.references :shopping_list, foreign_key: true
      
      t.timestamps
    end
  end
end
