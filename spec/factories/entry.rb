FactoryGirl.define do
	factory :entry do
		car_show
		entryDate Date.today
		entryType "Car"
	end
end