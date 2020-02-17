require 'rails_helper'

RSpec.describe Course, type: :model do
  context "creating a new course" do
    let(:user) { FactoryBot.create(:user) }
    describe "course validation rules" do
      it "should save a course with title, description, and cost" do
        course = Course.new(title: "Test", description: "Test", cost: 50, user_id: user.id)
        expect(course).to be_valid
      end
      it "should not save a course without a title" do
        course = Course.new(description: "Test", cost: 50, user_id: user.id)
        expect(course).to_not be_valid
      end
      it "should not save a course without a description" do
        course = Course.new(title: "Test", cost: 50, user_id: user.id)
        expect(course).to_not be_valid
      end
      it "should not save a course without a cost" do
        course = Course.new(title: "Test", description: "Test", user_id: user.id)
        expect(course).to_not be_valid
      end
    end
  end

  context "checking an existing course" do
    let(:free_course) { Course.new(cost: 0) }
    let(:premium_course) { Course.new(cost: 99) }
    describe "course#free?" do
      it "returns true if a course has a cost value of zero" do
        expect(free_course.free?).to eq true
      end
      it "returns false if a course has a cost value above zero" do
        expect(premium_course.free?).to eq false
      end
    end
    describe "it determines if a course is premium" do
      it "returns true if a course is not free" do
        expect(premium_course.premium?).to eq true
      end
      it "returns false if a course is free" do
        expect(free_course.premium?).to eq false
      end
    end
  end
end