require 'rails_helper'
require 'instructor/courses_controller.rb'

RSpec.describe Instructor::CoursesController, type: :controller do
  include_examples "curriculum"
  context "authorized instructor is logged in" do
    before :each do
      sign_in user
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
        test_course = Course.last
        expect(response).to redirect_to instructor_course_path(test_course)
        expect(test_course.title).to eq "Test Title"
        expect(test_course.description).to eq "Controller test"
        expect(test_course.cost).to eq 0
      end
      it "should render unprocessable_entity for invalid courses" do
        post :create, params: { course: { title: "Invalid Test Title" } }
        expect(response).to have_http_status(:unprocessable_entity)
        test_course = Course.last
        expect(test_course.title).not_to eq "Invalid Test Title"
      end
    end
    describe "courses#show" do
      it "should load the page for a valid id" do
        get :show, params: { id: course.id }
        expect(response).to have_http_status(:success)
      end
      it "should not load a page with an invalid id" do
        get :show, params: { id: "CATS" }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
  context "user is not logged in" do
    describe "courses#new" do
      it "should redirect unauthenticated users to sign in" do
        get :new  
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe "courses#create" do
      it "should redirect unauthenticated users to sign in" do
        get :create  
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe "courses#show" do
      it "should redirect unauthenticated users to sign in" do
        get :show, params: { id: course.id }  
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
  context "unauthorized instructor is logged in" do
    describe "courses#show" do
      it "should present an error if the incorrect user is logged in" do
        other_user = FactoryBot.create(:user)
        sign_in other_user
        get :show, params: {id: course.id}
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end