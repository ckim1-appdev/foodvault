class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.date :date_purchased
      t.integer :ingredient_count
      t.text :grocery_store
      t.integer :price
      t.integer :user_id

      t.timestamps
    end
  end
end
