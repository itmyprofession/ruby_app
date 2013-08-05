require_relative '../spec_helper'

describe "User Authentication" do

	describe "sign up process" do
		it "signup user" do
			visit '/users/sign_up'
			fill_in 'Email', with: 'user@example.com'
			fill_in 'Password', with: 'sekret'
			fill_in 'Password confirmation', with: 'sekret'
			click_button 'Sign up'
			
			page.should have_content('signed up')
			
			#expect(page).to_have_content 'signed up'
		end

		it "validation for signup process" do
				visit new_user_registration_path

				fill_in 'Email', with: ''
				fill_in 'Password', with: ''
				fill_in 'Password confirmation', with: ''
				#save_and_open_page
				click_button 'Sign up'

				expect(page).to have_content('Email')
		end
 	end

	describe "sign in process" do
		it "sign in user with fail condition to login" do
			visit user_session_path

			fill_in 'Email', with: 'user@example.com'
			fill_in 'Password', with: 'sekret'

			click_button 'Sign in'

			current_path.should == user_session_path
			save_and_open_page
			
			expect(page).to have_content 'Invalid email or password'
		end

		it "sign in user" do
			User.create(:email => 'santoshmoktan@lftechnology.com', :password => 'santosh11')

			visit user_session_path

			fill_in 'Email', with: 'santoshmoktan@lftechnology.com'
			fill_in 'Password', with: 'santosh11'

			click_button 'Sign in'

			current_path.should == root_path
			save_and_open_page
			expect(page).to have_content 'success'
		end
	end

end