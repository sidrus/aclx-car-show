FactoryGirl.define do
	factory :car_show do
		name "Father's Day Car Show"
		street "4522 Fredricksburg Rd"
		city "San Antonio"
		state "Texas"
		zipcode "78201"
		start "5/11/16 08:00"
		self.end "5/11/16 17:00"

		factory :car_show_with_entries do
			transient do
				entry_count 100
			end

			after(:create, :build) do |car_show, evaluator|
				create_list(:entry, evaluator.entry_count, car_show: car_show)
			end
		end
	end
end