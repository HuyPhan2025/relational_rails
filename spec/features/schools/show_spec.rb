require 'rails_helper'

RSpec.describe 'schools show page' do
  describe "As a user" do
    describe "When I visit '/parents/:id'" do
      it "I see the parent with that id including the parent's attributes" do
        school = School.create!(name: "Dry Creek", esl_program: false, tuition: 1000)
        
        visit "/schools/#{school.id}"

        expect(page).to have_content(school.name)
        expect(page).to have_content(school.esl_program)
        expect(page).to have_content(school.tuition)
      end
    end
  end
end