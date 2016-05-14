class AddFieldsToCarShow < ActiveRecord::Migration
  def change
    add_column :car_shows, :name, :string
    add_column :car_shows, :street, :string
    add_column :car_shows, :city, :string
    add_column :car_shows, :state, :string
    add_column :car_shows, :zipcode, :string
  end
end
