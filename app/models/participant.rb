class Participant < ActiveRecord::Base
	has_many :vehicles	

	def full_name
		return "#{firstName} #{lastName}"
	end	

	def full_address
		return "#{street},#{zipcode}"
	end
end
