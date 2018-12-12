class CreateBillHasIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :bill_has_ingredients do |t|
      t.integer :bill_id
      t.integer :ingredient_id
      t.integer :quantity
      t.text :bill_ingredient_unit

      t.timestamps
    end
  end
end
