class CarShow < ActiveRecord::Base	
	has_many :judges, foreign_key: "uid", class_name: "User"
	has_many :entries
	
	
end