class AddForeignKeysToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :participant_id, :integer
  end
end
