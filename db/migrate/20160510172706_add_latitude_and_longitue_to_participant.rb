class AddLatitudeAndLongitueToParticipant < ActiveRecord::Migration
  def change
    add_column :participants, :latitude, :float
    add_column :participants, :longitude, :float
  end
end
