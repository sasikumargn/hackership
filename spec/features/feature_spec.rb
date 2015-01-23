require_relative '../spec_helper'
require_relative '../rails_helper'

feature "View/Play Video and upload" do
	before(:each) do 
		visit "/"
	end

	scenario "User should able to view/play video" do
	  expect(page).to have_content "My First video"
	  expect(page).to have_selector "video"
	  expect(page).to have_xpath("//video")
	  expect(page).to have_xpath("//video/source[@src = '/videos/Mazhaiye_Mazhaiye_Eeram_Tamil.webm']")
	  expect(page).to have_xpath("//video/source[@type = 'video/webm']")
	  expect(page).to have_xpath("//video/source[@src = '/videos/Mazhaiye_Mazhaiye_Eeram_Tamil.mp4']")
	  expect(page).to have_xpath("//video/source[@type = 'video/mp4']")
	end

	# scenario "User should able to upload video" do
 #  	attach_file "uploadVideo", File.join(Rails.root, '/public/videos/Mazhaiye_Mazhaiye_Eeram_Tamil.mp4')
 #  	click_button "upload Video"
 #  	expect(page).to have_content "Successfully Uploaded Video"
	# end

end