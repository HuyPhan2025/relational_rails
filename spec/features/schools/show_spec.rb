require 'rails_helper'

RSpec.describe 'schools show page' do
  describe "As a user" do
    describe "When I visit '/parents/:id'" do
      it "I see the parent with that id including the parent's attributes" do
        school_1 = School.create!(name: "Dry Creek", esl_program: false, tuition: 1000)
        
        visit "/schools/#{school_1.id}"

        expect(page).to have_content(school_1.name)
        expect(page).to have_content("ESL Program: #{school_1.esl_program}")
        expect(page).to have_content("Tuition: #{school_1.tuition}")
      end
    end
  end
end