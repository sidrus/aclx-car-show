require 'rails_helper'

RSpec.feature "OAuth testing" do
	before do
		Capybara.default_host = 'localhost'
		OmniAuth.config.test_mode = true
		Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
		Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
			:provider => 'facebook',
			:uid => '12345',
			:info => {
				:nickname => 'test_user',
				:email => 'test@example.org'
			}
		})
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