class Vehicle < ActiveRecord::Base
	belongs_to :participant
	has_many :entries 
end
