class AddDishhasingredientCountToIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :dishhasingredients_count, :integer
  end
end
