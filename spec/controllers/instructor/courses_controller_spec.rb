require 'rails_helper'
require 'instructor/courses_controller.rb'

RSpec.describe Instructor::CoursesController, type: :controller do
  context "instructor logged in" do
    let(:user){ FactoryBot.create(:user) }
    describe "courses#new" do
      it "should load the page" do
        sign_in user
        get :new
        expect(response).to have_http_status(:success)
      end
    end
  end
end