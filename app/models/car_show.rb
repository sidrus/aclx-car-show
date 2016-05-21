class CarShow < ActiveRecord::Base	
	has_many :judges, foreign_key: "uid", class_name: "User"
	has_many :entries

	validates :name, presence: :true
	validates :start, presence: :true
	validates :end, presence: :true

	validate :start_time_is_before_end_time

	validates_associated :entries
	validates_associated :judges
	
	def full_address
		"#{street}, #{city}, #{state} #{zipcode}"
	end

	def start_time_is_before_end_time
		do_boundary_check = true

		if self.start == nil or self.end == nil then
			do_boundary_check = false
		end

		if do_boundary_check then
			if self.start > self.end then
				errors.add(:start, "can't be after the end date")
			end
		end
	end
end