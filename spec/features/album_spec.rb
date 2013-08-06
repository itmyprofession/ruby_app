require_relative '../spec_helper'

describe "Albums Ownership" do
	it "logged in user can create gallery" do
		user = User.create(
				email: 'santoshmoktan@lftechnology.com',
				password: 'santosh11'
			)

		user2 = User.create(
			email: 'hello@example.com', 
			password: 'sekret'
		)

		visit user_session_path #'/users/sign_in'

		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password

		click_button 'Sign in'

		#visit new_album_path
		
		
		click_link "New Album"	
		
		fill_in 'Title', with: 'My Album'
		click_button 'Create Album'

		expect(Album.last.title).to eq('My Album')
		expect(Album.last.user).to eq(user)
		expect(Album.last.user).not_to eq(user2)
	end
end

describe "Show only user album" do
	it "show current user album" do

		user = User.create(
				email: 'santoshmoktan@lftechnology.com',
				password: 'santosh11'
		)

		user2 = User.create(
			email: 'hello@example.com', 
			password: 'sekret'
		)

		visit user_session_path #'/users/sign_in'

		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password

		click_button 'Sign in'

		#visit new_album_path
		
		
		click_link "New Album"	
		
		fill_in 'Title', with: 'My Album5'
		click_button 'Create Album'

		#visit destroy_user_session_path
		#visit "/users/sign_out"

		click_link 'Sign out'

		save_and_open_page

		visit user_session_path #'/users/sign_in'

		fill_in 'Email', with: user2.email
		fill_in 'Password', with: user2.password

		click_button 'Sign in'

		#visit new_album_path
		
		
		click_link "New Album"	
		
		fill_in 'Title', with: 'My Album2'
		click_button 'Create Album'

		visit albums_path

		expect(page).to have_content('My Album2')
		expect(page).not_to have_content('My Album5')
	end
end