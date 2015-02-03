require_relative '../spec_helper'
require_relative '../rails_helper'

feature "Display list of videos" do
	let(:video) {FactoryGirl.create(:video)}
	# before(:each) do 
	# 	video
	# end

	scenario "User should able to view/play videos" do
		video
		visit "/videos"
	  expect(page).to have_content "Listing videos"
	  expect(page).to have_selector "video"
	  expect(page).to have_xpath("//video")
	  expect(page).to have_xpath("//video/source[@type = 'video/webm']")
	  expect(page).to have_xpath("//video/source[@type = 'video/mp4']")
	end

	scenario "User should able to upload video" do
		visit "/videos/new"
  	attach_file "uploadVideo", File.join(Rails.root, '/public/videos/Mazhaiye_Mazhaiye_Eeram_Tamil.mp4')
  	click_button "upload Video"
  	expect(page).to have_content "Successfully Uploaded Video"
	end

end