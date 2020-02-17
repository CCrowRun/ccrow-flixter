require 'rails_helper'

RSpec.describe Lesson, type: :model do
  include_examples "curriculum"
  describe "next_lesson" do
    it "should return the lesson with the next rank" do
      expect(lesson.next_lesson.id).to eq lesson_2.id
    end
    it "should return the first lesson in the next section if the next lesson is blank" do
      expect(lesson_2.next_lesson.id).to eq lesson_3.id
    end
  end
end
