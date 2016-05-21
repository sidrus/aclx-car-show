require 'rails_helper'

RSpec.feature "Car Show" do
	given(:new_show_link) { find_link('New Car Show') }
	

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
	
	scenario 'should allow a user to create a new show from the index page' do
		configure_oauth_for_test
		visit user_facebook_omniauth_authorize_url

		# make sure we start from the car show index
		visit car_shows_url
		expect(page).to have_text("Car Shows")

		# ensure the links have the correct css styling		
		expect(new_show_link[:class]).to match(/btn/)
		expect(new_show_link[:class]).to match(/btn-secondary/)
		expect(new_show_link[:class]).to match(/btn-sm/)

		# make sure we got the right page
		click_link('New Car Show')
		expect(page).to have_content("New Car Show")
	end

	scenario 'should not allow the creation of car shows without a name' do
		configure_oauth_for_test
		visit user_facebook_omniauth_authorize_url
		visit new_car_show_url

		# make sure we got the right page
		expect(page).to have_content("New Car Show")

		# build a car show
		@show = build(:car_show)

		fill_in('car_show_name', with: nil)
		fill_in('car_show_street', with: @show.street)
		fill_in('car_show_city', with: @show.city)
		fill_in('car_show_state', with: @show.state)
		fill_in('car_show_zipcode', with: @show.zipcode)
		fill_in('car_show_start', with: @show.start)
		fill_in('car_show_end', with: @show.end)

		click_button('submit')
		expect(page).to have_content("prohibited this car show from being saved")
	end

	scenario 'should not allow the creation of car shows without a start date' do
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
		fill_in('car_show_start', with: nil)
		fill_in('car_show_end', with: @show.end)

		click_button('submit')
		expect(page).to have_content("prohibited this car show from being saved")
	end

	scenario 'should not allow the creation of car shows without a name' do
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
		fill_in('car_show_end', with: nil)

		click_button('submit')
		expect(page).to have_content("prohibited this car show from being saved")
	end

	scenario 'should not allow the creation of car shows without a name' do
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
		fill_in('car_show_start', with: @show.end)
		fill_in('car_show_end', with: @show.start)

		click_button('submit')
		expect(page).to have_content("prohibited this car show from being saved")
	end

	scenario 'should not allow the creation of car shows with invalid start date' do
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
		fill_in('car_show_start', with: "1234567890")
		fill_in('car_show_end', with: @show.end)

		click_button('submit')
		expect(page).to have_content("prohibited this car show from being saved")
	end

	scenario 'should not allow the creation of car shows with invalid start date' do
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
		fill_in('car_show_start', with: "This is an invalid start date")
		fill_in('car_show_end', with: @show.end)

		click_button('submit')
		expect(page).to have_content("prohibited this car show from being saved")
	end

	scenario 'should not allow the creation of car shows with invalid start date' do
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
		fill_in('car_show_start', with: "1234567890")
		fill_in('car_show_end', with: @show.end)

		click_button('submit')
		expect(page).to have_content("prohibited this car show from being saved")
	end

	scenario 'should not allow the creation of car shows with invalid start date' do
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
		fill_in('car_show_end', with: "This is an invalid end date")

		click_button('submit')
		expect(page).to have_content("prohibited this car show from being saved")
	end

	scenario 'should not allow the creation of car shows with invalid start date' do
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
		fill_in('car_show_end', with: "1234567890")

		click_button('submit')
		expect(page).to have_content("prohibited this car show from being saved")
	end
end