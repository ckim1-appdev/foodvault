class CreateDishHasIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :dish_has_ingredients do |t|
      t.integer :dish_id
      t.integer :ingredient_id
      t.integer :quantity
      t.text :dish_ingredient_unit

      t.timestamps
    end
  end
end
