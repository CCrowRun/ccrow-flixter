require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe "courses#index" do
    it "should load the page" do
      get :index

      expect(response).to have_http_status(:success)
    end

    it "should load all courses on the index page"
  end

  describe "courses#show" do
    it "should load the page with a valid id"

    it "should present an error with an invalid id"
  end
end
