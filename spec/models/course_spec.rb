require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:free_course) { Course.new(cost: 0) }
  let(:premium_course) { Course.new(cost: 99) }
  describe "course#free?" do
    it "returns true if a course has a cost value of zero" do
      expect(free_course.free?).to eq true
    end

  end

  describe "it determines if a course is premium"
end