require 'rails_helper'

RSpec.feature "Login page" do
	scenario 'should redirect to login for anonymous user' do
		visit car_shows_url
		expect(page).to have_content("Sign in with")
	end

	scenario 'should not show create links for anonymous user' do
		visit root_url
		expect(page).not_to have_content("New Show")
	end

	scenario 'should not show create links for anonymous user' do
		visit root_url
		expect(page).not_to have_content("New Vehicle")
	end

	scenario 'should not show create links for anonymous user' do
		visit root_url
		expect(page).not_to have_content("New Participant")
	end

	scenario 'should not show create links for anonymous user' do
		visit root_url
		expect(page).not_to have_content("New Entry")
	end
end