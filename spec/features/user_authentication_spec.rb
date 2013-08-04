require_relative '../spec_helper'

describe "User Authentication" do
	it "signup user" do
		visit '/users/sign_up'
		fill_in 'Email', with: 'user@example.com'
		fill_in 'Password', with: 'sekret'
		fill_in 'Password confirmation', with: 'sekret'
		click_button 'Sign up'
		
		page.should have_content('signed up')
		
		#expect(page).to_have_content 'signed up'
	end

	it "sign in user" do
		visit user_session_path

		fill_in 'Email', with: 'user@example.com'
		fill_in 'Password', with: 'sekret'

		click_button 'Sign in'

		current_path.should == new_users_session_path
		
		expect(page).to have_content 'Invalid email or password'
	end

end