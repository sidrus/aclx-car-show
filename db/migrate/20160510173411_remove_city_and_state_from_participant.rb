class RemoveCityAndStateFromParticipant < ActiveRecord::Migration
  def change
  	remove_column :participants, :city
  	remove_column :participants, :state
  end
end
