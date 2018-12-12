class CreateDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :dishes do |t|
      t.text :name
      t.text :cuisine
      t.text :meal_category
      t.string :picture
      t.text :description
      t.integer :ingredient_count

      t.timestamps
    end
  end
end
