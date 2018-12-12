class AddBillCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bills_count, :integer
  end
end
