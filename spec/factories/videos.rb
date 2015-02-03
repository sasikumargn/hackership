include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :video do
    movie { fixture_file_upload( Rails.root.join("spec","fixtures","Funny_indian_boys_stopping_a_bus_comedy_video.mp4"), "video/mp4") }
  end
end
