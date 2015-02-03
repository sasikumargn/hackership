require 'rails_helper'

# RSpec.describe Video, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


RSpec.describe Video, :type => :model do

  # it { expect validate_presence_of :movie }

  context "Factory settings for Video" do
    it "should be valid" do
      video = FactoryGirl.build(:video)
      expect(video).to be_valid
    end
  end

end

