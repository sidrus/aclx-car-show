class CreateCarShows < ActiveRecord::Migration
  def change
    create_table :car_shows do |t|
      t.datetime :start
      t.datetime :end

      t.timestamps null: false
    end
  end
end
