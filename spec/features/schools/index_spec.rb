require 'rails_helper'

RSpec.describe "School Index Page", type: :feature do
  describe "As a user" do
    describe "When I visit '/parents'" do
      it "Then I see the name of each parent record in the system" do
        school_1 = School.create!(name: "Dry Creek", esl_program: false, tuition: 1000)
        school_2 = School.create!(name: "Walnut Hill", esl_program: true, tuition: 1500)

        visit "/schools"

        expect(page).to have_content(school_1.name)
        expect(page).to have_content(school_2.name)
      end
    end
  end
end