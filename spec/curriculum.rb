RSpec.shared_examples "curriculum" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:course) { FactoryBot.create :course, title: "Ranked_sections", description: "Test next_section", cost: 20, user_id: user.id }
  let!(:section) { FactoryBot.create :section, title: "Section 1", course_id: course.id, row_order: 0 }
  let!(:section_2) { FactoryBot.create :section, title: "Section 2", course_id: course.id, row_order: 1 }
  let!(:lesson) { FactoryBot.create :lesson, section_id: section.id, row_order: 0 }
  let!(:lesson_2) { FactoryBot.create :lesson, section_id: section.id, row_order: 1 }
  let!(:lesson_3) { FactoryBot.create :lesson, section_id: section_2.id, row_order: 2 }
end