require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe "courses#index" do
    it "should load the page" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe "courses#show" do
    let(:user) { FactoryBot.create(:user) }
    it "should load the page with a valid id" do
      course = FactoryBot.create(:course, user_id: user.id)

      get :show, params: { id: course.id }

      expect(response).to have_http_status(:success)
    end

    it "should present an error with an invalid id"
  end
end
