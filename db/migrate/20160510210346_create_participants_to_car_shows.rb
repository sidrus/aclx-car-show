class CreateParticipantsToCarShows < ActiveRecord::Migration
  def change
    create_table :participants_to_car_shows do |t|
      t.integer :participant_id
      t.integer :car_show_id

      t.timestamps null: false
    end
  end
end
