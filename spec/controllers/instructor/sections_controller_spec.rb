require 'rails_helper'
require 'instructor/sections_controller.rb'

RSpec.describe Instructor::SectionsController, type: :controller do
  include_examples "curriculum"
  context "instructor logged in" do
    before :each do
      user = FactoryBot.create(:user)
      sign_in user
      @test_course = FactoryBot.create(:course, user_id: user.id)
    end
    describe "sections#create" do
      it "should create section under course with valid parameters" do
        post :create, params: {
          course_id: @test_course.id,
          section: { 
            title: "Test Section",
            course_id: @test_course.id 
          }
        }
        expect(response).to redirect_to instructor_course_path(@test_course)
        section = Section.last
        expect(section.title).to eq "Test Section"
      end
      it "should not create a section with invalid paramaters" do
        post :create, params: {
          course_id: @test_course.id,
          section: { 
            course_id: @test_course.id 
          }
        }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
    describe "sections#update" do
      it "should update attributes to reflect new params" do
        section = FactoryBot.create(:section, course_id: @test_course.id)
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
  context "instructor not logged in" do
    before :each do
      other_user = FactoryBot.create(:user)
      @course = FactoryBot.create(:course, user_id: other_user.id)
    end
    describe "sections#create" do
      it "should redirect unauthenticated users to sign in" 
      it "should present unauthorized if the user did not create the course"
    end
    describe "sections#update" do
      it "should redirect unauthenticated users to sign in" 
      it "should present unauthorized if the user did not create the section"
    end
  end
end