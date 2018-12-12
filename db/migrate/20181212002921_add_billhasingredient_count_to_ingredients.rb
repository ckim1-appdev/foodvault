class AddBillhasingredientCountToIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :billhasingredients_count, :integer
  end
end
