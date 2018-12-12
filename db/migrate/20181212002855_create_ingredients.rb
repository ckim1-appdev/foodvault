class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.text :name
      t.text :quality
      t.text :food_group
      t.string :picture
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
