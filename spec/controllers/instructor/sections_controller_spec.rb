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
      it "should create section under course with valid parameters"
      it "should not create a section with invalid paramaters"
    end
    describe "sections#update" do
      it "should update attributes to reflect new params" 
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