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
        new_lesson = Lesson.last
        expect(new_lesson.section_id).to eq section.id
        expect(new_lesson.title).to eq "New Lesson"
      end
      it "should not create a lesson with invalid paramaters" do
        post :create, params: {
          section_id: section.id,
          lesson: {
            title: "Incomplete Lesson"
          }
        }
        expect(response).to have_http_status(:unprocessable_entity)
        new_lesson = Lesson.last
        expect(new_lesson.title).not_to eq "Incomplete Lesson"
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
        lesson.reload
        expect(lesson.subtitle).to eq "New subtitle"
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
        new_lesson = Lesson.last
        expect(new_lesson.title).not_to eq "Unauthenticed Lesson"
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
        lesson.reload
        expect(lesson.subtitle).not_to eq "Unauthenticed"
      end
    end
  end
  context "unauthorized instructor is logged in" do
    before :each do
      @other_user = FactoryBot.create(:user)
    end
    describe "lessons#create" do
      it "should present unauthorized if the user did not create the course" do
        sign_in @other_user
        post :create, params: {
          section_id: section.id,
          lesson: {
            title: "Unauthorized Lesson",
            subtitle: "Test create action"
          }
        }
        expect(response).to have_http_status(:unauthorized)
        new_lesson = Lesson.last
        expect(new_lesson.title).not_to eq "Unauthorized Lesson"
      end
    end
    describe "lessons#update" do
      it "should present unauthorized if the user did not create the section" do
        sign_in @other_user
        patch :update, params: {
          id: lesson.id,
          lesson: {
            subtitle: "Unauthorized"
          }
        }
        expect(response).to have_http_status(:unauthorized)
        lesson.reload
        expect(lesson.subtitle).not_to eq "Unauthorized"
      end
    end
  end
end