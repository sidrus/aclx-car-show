class CarShow < ActiveRecord::Base	
	has_many :judges, foreign_key: "uid", class_name: "User"
	has_many :entries
	
	def full_address
		"#{street}, #{city}, #{state} #{zipcode}"
	end
end