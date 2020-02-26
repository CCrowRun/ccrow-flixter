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
      it "should not create a lesson with invalid paramaters" do
        post :create, params: {
          section_id: section.id,
          lesson: {
            title: "Incomplete Lesson"
          }
        }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
    describe "lessons#update" do
      it "should update attributes to reflect new params" do
        patch :update, params: {
          id: lesson.id,
          lesson: {
            subtitle: "New subtitle"
          }
        }
        expect(response).to have_http_status(:success)
      end
    end
  end
  context "user is not logged in" do
    describe "lessons#create" do
      it "should redirect unauthenticated users to sign in" do
        post :create, params: {
          section_id: section.id,
          lesson: {
            title: "Unauthenticated Lesson",
            subtitle: "Test create action"
          }
        }
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe "lessons#update" do
      it "should redirect unauthenticated users to sign in" do
        patch :update, params: {
          id: lesson.id,
          lesson: {
            subtitle: "Unauthenticated"
          }
        }
        expect(response).to redirect_to new_user_session_path
      end
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