class AddForeignKeysToCarShow < ActiveRecord::Migration
  def change
    add_column :car_shows, :user_id, :integer
  end
end
