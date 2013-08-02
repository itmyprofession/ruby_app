require_relative '../spec_helper'

describe "User Authentication" do
	it "signup user" do
		visit '/users/sign_up'
		fill_in 'Email', with: 'user@example.com'
		fill_in 'Password', with: 'sekret'
		fill_in 'Password confirmation', with: 'sekret'
		click_button 'Sign up'
		save_and_open_page
		#page.should_have_content 'Signed up!'
		expect(page).to_have_content 'Signed up!'
	end
end