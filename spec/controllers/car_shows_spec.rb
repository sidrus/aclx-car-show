require 'rails_helper'

RSpec.describe CarShowsController do
	login_user

	it "should delete car shows" do
		@show = create(:car_show)
		
		expect {
			delete :destroy, id: @show
		}.to change(CarShow, :count).by(-1)
	end
end