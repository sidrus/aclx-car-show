class AddForeignKeysToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :car_show_id, :integer
    add_column :entries, :vehicle_id, :integer
  end
end
