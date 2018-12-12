class AddBillhasingredientCountToBills < ActiveRecord::Migration[5.1]
  def change
    add_column :bills, :billhasingredients_count, :integer
  end
end
