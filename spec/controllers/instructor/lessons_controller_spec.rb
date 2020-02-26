require 'rails_helper'
require 'instructor/lessons_controller.rb'

RSpec.describe Instructor::LessonsController, type: :controller do
  include_examples "curriculum"
  context "authorized instructor is logged in" do
    before :each do
      sign_in user
    end
    describe "lessons#create" do
      it "should create lesson under section with valid parameters" do
        post :create, params: {
          section_id: section.id,
          lesson: {
            title: "New Lesson",
            subtitle: "Test create action"
          }
        }
        expect(response).to redirect_to instructor_course_path(course)
      end
      it "should not create a lesson with invalid paramaters"
    end
    describe "lessons#update" do
      it "should update attributes to reflect new params" 
    end
  end
  context "user is not logged in" do
    describe "lessons#create" do
      it "should redirect unauthenticated users to sign in"
        # post :create, params: {
        #   course_id: course.id,
        #   section: { 
        #     title: "Unauthenticated Section",
        #     course_id: course.id 
        #   }
        # }
        # expect(response).to redirect_to new_user_session_path
    end
    describe "lessons#update" do
      it "should redirect unauthenticated users to sign in"
        # patch :update, params: {
        #   id: section.id,
        #   section: {
        #     title: "Unauthenticated"
        #   }
        # }
        # expect(response).to redirect_to new_user_session_path
    end
  end
  context "unauthorized instructor is logged in" do
    before :each do
      @other_user = FactoryBot.create(:user)
    end
    describe "lessons#create" do
      it "should present unauthorized if the user did not create the course"
        # sign_in @other_user
        # post :create, params: {
        #   course_id: course.id,
        #   section: { 
        #     title: "Unauthorized",
        #     course_id: course.id 
        #   }
        # }
        # expect(response).to have_http_status(:unauthorized)
    end
    describe "lessons#update" do
      it "should present unauthorized if the user did not create the section"
        # sign_in @other_user
        # patch :update, params: {
        #   id: section.id,
        #   section: {
        #     title: "Unauthenticated"
        #   }
        # }
        # expect(response).to have_http_status(:unauthorized)
    end
  end
end