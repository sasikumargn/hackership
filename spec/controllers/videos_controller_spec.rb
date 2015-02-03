require 'rails_helper'

RSpec.describe VideosController, :type => :controller do

  let(:video) {FactoryGirl.create(:video)}
  let(:valid_attributes){ FactoryGirl.attributes_for(:video) }

  describe "GET index" do
    it "should show all videos" do
      get :index
      assert_response :success
      expect(assigns(:videos)).to be_empty
      expect(response.code).to eq("200")
    end
  end

  describe "GET new" do
    it "should get new" do
      get :new
      assert_response :success
    end
  end

  describe "POST create" do
    it "should create video" do
      expect { post :create, video: valid_attributes }.to change { Video.count }
      expect(response).to redirect_to(video_path(assigns(:video)))
    end
  end

  describe "GET show" do
    it "should show video" do
      get :show, id: video
      assert_response :success
    end
  end

  describe "GET edit" do
    it "should get edit video" do
      get :edit, id: video
      assert_response :success
    end
  end

  describe "PATCH update" do
    it "should update video" do
      patch :update, id: video, video: valid_attributes
      expect(response).to redirect_to(video_path(assigns(:video)))
    end
  end

  describe "DELETE destroy" do
    it "should delete video" do
      delete :destroy, id: video
      expect(response).to redirect_to(videos_path)
    end
  end

end