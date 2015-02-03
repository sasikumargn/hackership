require_relative '../spec_helper'
require_relative '../rails_helper'

feature "Display list of videos" do
	let(:video) {FactoryGirl.create(:video)}
	scenario "User should able to view/play videos" do
		video
		visit "/"
	  expect(page).to have_content "Listing videos"
	  expect(page).to have_selector "video"
	  expect(page).to have_xpath("//video")
	  expect(page).to have_xpath("//video/source[@type = 'video/webm']")
	  expect(page).to have_xpath("//video/source[@type = 'video/mp4']")
	end
end

feature "Create new video" do
	scenario "User should able to create new video" do
		visit "/new"
  	attach_file "video_movie", File.join(Rails.root, '/public/videos/Micromax_Canvas_Fun_video_sample.mp4')
  	click_button "Create Video"
  	expect(page).to have_content "Video was successfully created."
	end
end

feature "Edit and Update video" do
	let(:video) {FactoryGirl.create(:video)}
	scenario "User should able to edit and update video" do
		visit edit_video_path(video)
  	attach_file "video_movie", File.join(Rails.root, '/public/videos/Micromax_Canvas_Fun_video_sample.mp4')
  	click_button "Update Video"
  	expect(page).to have_content "Video was successfully updated."
	end
end


feature "Delete video" do
  let(:video) {FactoryGirl.create(:video)}

  scenario "user should able to delete video" do
  	video
    visit "/#{video.id}/"
    expect(page).to have_xpath("//video")
	  expect(page).to have_xpath("//video/source[@type = 'video/webm']")
	  expect(page).to have_xpath("//video/source[@type = 'video/mp4']")
    click_link "Destroy"
    expect(page).not_to have_xpath("//video")
	  expect(page).not_to have_xpath("//video/source[@type = 'video/webm']")
	  expect(page).not_to have_xpath("//video/source[@type = 'video/mp4']")
  end
end