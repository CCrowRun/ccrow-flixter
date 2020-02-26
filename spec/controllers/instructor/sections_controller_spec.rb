require 'rails_helper'
require 'instructor/sections_controller.rb'

RSpec.describe Instructor::SectionsController, type: :controller do
  include_examples "curriculum"
  context "authorized instructor is logged in" do
    before :each do
      sign_in user
    end
    describe "sections#create" do
      it "should create section under course with valid parameters" do
        post :create, params: {
          course_id: course.id,
          section: { 
            title: "New Section",
            course_id: course.id 
          }
        }
        expect(response).to redirect_to instructor_course_path(course)
        new_section = Section.last
        expect(new_section.title).to eq "New Section"
      end
      it "should not create a section with invalid paramaters" do
        post :create, params: {
          course_id: course.id,
          section: { 
            course_id: course.id 
          }
        }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
    describe "sections#update" do
      it "should update attributes to reflect new params" do
        patch :update, params: {
          id: section.id,
          section: {
            title: "New Title"
          }
        }
        expect(response).to have_http_status(:success)
        section.reload
        expect(section.title).to eq "New Title"
      end
    end
  end
  context "user is not logged in" do
    describe "sections#create" do
      it "should redirect unauthenticated users to sign in" do
        post :create, params: {
          course_id: course.id,
          section: { 
            title: "Unauthenticated Section",
            course_id: course.id 
          }
        }
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe "sections#update" do
      it "should redirect unauthenticated users to sign in" do
        patch :update, params: {
          id: section.id,
          section: {
            title: "Unauthenticated"
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
    describe "sections#create" do
      it "should present unauthorized if the user did not create the course" do
        sign_in @other_user
        post :create, params: {
          course_id: course.id,
          section: { 
            title: "Unauthorized",
            course_id: course.id 
          }
        }
        expect(response).to have_http_status(:unauthorized)
      end
    end
    describe "sections#update" do
      it "should present unauthorized if the user did not create the section" do
        sign_in @other_user
        patch :update, params: {
          id: section.id,
          section: {
            title: "Unauthenticated"
          }
        }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end