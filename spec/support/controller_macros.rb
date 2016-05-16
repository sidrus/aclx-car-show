module ControllerMacros
	def login_admin
		before(:each) do
			Rails.application.env_config["devise.mapping"] = Devise.mappings[:admin]
			admin = FactoryGirl.create(:admin)
			sign_in :user, admin
		end
	end

	def login_user
		before(:each) do
			Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
			sign_in FactoryGirl.create(:user)
		end
	end
end