class Entry < ActiveRecord::Base
	belongs_to :car_show
	belongs_to :vehicle
end
