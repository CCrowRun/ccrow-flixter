require 'rails_helper'
require 'instructor/courses_controller.rb'

RSpec.describe Instructor::CoursesController, type: :controller do
  context "instructor logged in" do
    before :each do
      user = FactoryBot.create(:user)
      sign_in user
    end
    describe "courses#new" do
      it "should load the page" do
        get :new
        expect(response).to have_http_status(:success)
      end
      it "should generate a new course in the database" do
        get :new
        expect(Course.last).to eq @course
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
      it "should render unprocessable_entity for invalid courses"
    end
    describe "courses#show" do
      it "should load the page for a valid id"

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