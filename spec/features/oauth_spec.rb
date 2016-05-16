require 'rails_helper'

RSpec.feature "OAuth testing" do
	before do
		configure_oauth_for_test
	end

	scenario 'should allow signed-in user to view home page' do
		# Make sure we see the sign in page
		visit root_url
		expect(page).to have_content("Sign in with")

		# Sign in with Facebook
		visit user_facebook_omniauth_authorize_url

		# Ensure we're now seeing the Car Show index
		visit root_url
		expect(page).to have_content("Listing Car Shows")
	end
end