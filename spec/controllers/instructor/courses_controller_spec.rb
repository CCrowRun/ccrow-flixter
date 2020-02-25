require 'rails_helper'
require 'instructor/courses_controller.rb'

RSpec.describe Instructor::CoursesController, type: :controller do
  context "instructor logged in" do
    before :each do
      user = FactoryBot.create(:user)
      sign_in user
      @test_course = FactoryBot.create(:course, user_id: user.id)
    end
    describe "courses#new" do
      it "should load the page" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end
    describe "courses#create" do
      it "should create courses with valid parameters" do
        post :create, params: { course: { title: "Test Title", description: "Controller test", cost: 0 } }
        course = Course.last
        expect(response).to redirect_to instructor_course_path(course)
        expect(course.title).to eq "Test Title"
        expect(course.description).to eq "Controller test"
        expect(course.cost).to eq 0
      end
      it "should render unprocessable_entity for invalid courses" do
        post :create, params: { course: { title: "Invalid Test Title" } }
        expect(response).to have_http_status(:unprocessable_entity)
        course = Course.last
        expect(course.title).not_to eq "Invalid Test Title"
      end
    end
    describe "courses#show" do
      it "should load the page for a valid id" do
        get :show, params: { id: @test_course.id }
        expect(response).to have_http_status(:success)
      end
      it "should not load a page with an invalid id"

    end
  end
  context "instructor logged in" do
    let(:user){ FactoryBot.create(:user) }
    describe "courses#new" do
      it "present an error if the user is not logged in" 
    end
    describe "courses#create" do
      it "present an error if the user is not logged in" 
    end
    describe "courses#show" do
      it "present an error if the user is not logged in" 
    end
  end
end