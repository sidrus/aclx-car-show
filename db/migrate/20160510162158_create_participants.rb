class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :phone

      t.timestamps null: false
    end
  end
end
