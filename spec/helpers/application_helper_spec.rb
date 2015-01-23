require "rails_helper"

describe ApplicationHelper do
  describe "#video_tag" do
    it "returns the video_tag with string or array of strings" do
      expect(helper.video_tag("Mazhaiye_Mazhaiye_Eeram_Tamil.mp4")).to eq("<video src=\"/videos/Mazhaiye_Mazhaiye_Eeram_Tamil.mp4\"></video>")
      expect(helper.video_tag(["Mazhaiye_Mazhaiye_Eeram_Tamil.mp4","Mazhaiye_Mazhaiye_Eeram_Tamil.webm"])).to eq("<video><source src=\"/videos/Mazhaiye_Mazhaiye_Eeram_Tamil.mp4\" /><source src=\"/videos/Mazhaiye_Mazhaiye_Eeram_Tamil.webm\" /></video>")
      expect(helper.video_tag("Mazhaiye_Mazhaiye_Eeram_Tamil.mp4", :size => "320x240", :controls => true)).to eq("<video controls=\"controls\" width=\"320\" height=\"240\" src=\"/videos/Mazhaiye_Mazhaiye_Eeram_Tamil.mp4\"></video>")
      expect(helper.video_tag(["Mazhaiye_Mazhaiye_Eeram_Tamil.mp4","Mazhaiye_Mazhaiye_Eeram_Tamil.webm"], :size => "320x240", :controls => true)).to eq("<video controls=\"controls\" width=\"320\" height=\"240\"><source src=\"/videos/Mazhaiye_Mazhaiye_Eeram_Tamil.mp4\" /><source src=\"/videos/Mazhaiye_Mazhaiye_Eeram_Tamil.webm\" /></video>")
    end
    it "returns the video_tag with src and file_type when given src and file_type as hashkeys" do
    	expect(helper.video_tag("Mazhaiye_Mazhaiye_Eeram_Tamil.mp4", type: "video/mp4")).to eq("<video type=\"video/mp4\" src=\"/videos/Mazhaiye_Mazhaiye_Eeram_Tamil.mp4\"></video>")
      expect(helper.video_tag("Mazhaiye_Mazhaiye_Eeram_Tamil.mp4", type: "video/mp4", :size => "320x240", :controls => true)).to eq("<video type=\"video/mp4\" controls=\"controls\" width=\"320\" height=\"240\" src=\"/videos/Mazhaiye_Mazhaiye_Eeram_Tamil.mp4\"></video>")
    end
    it "returns the video_tag with multiple sourec tag with src and file_type when given an array of type as hashes" do
      expect(helper.video_tag(["Mazhaiye_Mazhaiye_Eeram_Tamil.mp4",type: "video/mp4"],["Mazhaiye_Mazhaiye_Eeram_Tamil.webm", type: "video/webm"])).to eq("<video><source src=\"/videos/Mazhaiye_Mazhaiye_Eeram_Tamil.mp4\" type=\"video/mp4\" /><source src=\"/videos/Mazhaiye_Mazhaiye_Eeram_Tamil.webm\" type=\"video/webm\" /></video>")
      expect(helper.video_tag(["Mazhaiye_Mazhaiye_Eeram_Tamil.mp4",type: "video/mp4"],["Mazhaiye_Mazhaiye_Eeram_Tamil.webm", type: "video/webm"])).to eq("<video><source src=\"/videos/Mazhaiye_Mazhaiye_Eeram_Tamil.mp4\" type=\"video/mp4\" /><source src=\"/videos/Mazhaiye_Mazhaiye_Eeram_Tamil.webm\" type=\"video/webm\" /></video>")
      expect(helper.video_tag(["Mazhaiye_Mazhaiye_Eeram_Tamil.mp4",type: "video/mp4"],["Mazhaiye_Mazhaiye_Eeram_Tamil.webm", type: "video/webm"], :size => "320x240", :controls => true)).to eq("<video controls=\"controls\" width=\"320\" height=\"240\"><source src=\"/videos/Mazhaiye_Mazhaiye_Eeram_Tamil.mp4\" type=\"video/mp4\" /><source src=\"/videos/Mazhaiye_Mazhaiye_Eeram_Tamil.webm\" type=\"video/webm\" /></video>")
    end
  end
end