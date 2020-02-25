require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "static_pages#index" do
    it "should successfully load the index page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  describe "static_pages#privacy" do
    it "should successfully load the privacy page" do
      get :privacy
      expect(response).to have_http_status(:success)
    end
  end
  describe "static_pages#team" do
    it "should successfully load the team page" do
      get :team
      expect(response).to have_http_status(:success)
    end
  end
  describe "static_pages#careers" do
    it "should successfully load the careers page" do
      get :careers
      expect(response).to have_http_status(:success)
    end
  end
end