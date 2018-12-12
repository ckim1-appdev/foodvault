class AddFilmographyCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :filmography_count, :integer
  end
end
