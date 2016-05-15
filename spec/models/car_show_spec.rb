require 'rails_helper'

RSpec.describe CarShow, type: :model do
	before do
		@show = build(:car_show)
		@show.entries = build_list(:entry, 100)
	end

	it "should return a user-friendly address string" do
  		expect(@show.full_address).to eq("#{@show.street}, #{@show.city}, #{@show.state} #{@show.zipcode}")
	end

	it "should handle multiple entries" do
		@big_show = build(:car_show_with_entries)
		expect(@big_show.entries.count).to eq(100)
	end
end