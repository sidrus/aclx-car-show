require 'rails_helper'

RSpec.feature "OAuth testing" do	

	scenario 'should redirect to login for anonymous user' do
		visit car_shows_url
		expect(page).to have_content("Sign in with")
	end

	scenario 'should allow the creation of new shows' do
		configure_oauth_for_test
		visit user_facebook_omniauth_authorize_url
		visit new_car_show_url

		# make sure we got the right page
		expect(page).to have_content("New Car Show")

		# build a car show
		@show = build(:car_show)

		fill_in('car_show_name', with: @show.name)
		fill_in('car_show_street', with: @show.street)
		fill_in('car_show_city', with: @show.city)
		fill_in('car_show_state', with: @show.state)
		fill_in('car_show_zipcode', with: @show.zipcode)
		fill_in('car_show_start', with: @show.start)
		fill_in('car_show_end', with: @show.end)

		click_button('submit')
		expect(page).to have_content('Car show was successfully created.')
	end

	scenario 'should allow a show to be updated' do
		configure_oauth_for_test
		visit user_facebook_omniauth_authorize_url

		# create a show in the database
		@show = create(:car_show)

		visit edit_car_show_url(@show)
		fill_in('car_show_name', with: "#{@show.name} (edited)")

		click_button :submit
		expect(page).to have_content('Car show was successfully updated.')
		expect(page).to have_content("#{@show.name} (edited)")
	end
end