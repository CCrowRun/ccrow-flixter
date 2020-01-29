require 'rails_helper'

RSpec.describe Section, type: :model do
  include_examples "curriculum"
  
  describe "next_section" do
    it "should return the next section in the ranked order" do
      expect(section.next_section.title).to eq "Section 2"
    end
  end
end