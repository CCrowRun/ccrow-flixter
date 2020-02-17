require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do
  describe "dashboard#show" do
    let!(:user){ FactoryBot.create(:user) }
    it "should show a user's dashboard" do
      sign_in user
      get :show
      expect(response).to have_http_status(:success)
    end
  end
end