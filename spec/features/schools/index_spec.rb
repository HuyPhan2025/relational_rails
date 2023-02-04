require 'rails_helper'

RSpec.describe "School Index Page", type: :feature do
  describe "As a user" do
    describe "When I visit '/schools'" do
      it "Then I see the name of each school record in the system" do
        school_1 = School.create!(name: "Dry Creek", esl_program: false, tuition: 1000)
        school_2 = School.create!(name: "Walnut Hill", esl_program: true, tuition: 1500)

        visit "/schools"

        expect(page).to have_content(school_1.name)
        expect(page).to have_content(school_2.name)
      end
    end
  end

  describe "user story 6" do
    let!(:school_1) { School.create!(name: "Dry Creek", esl_program: false, tuition: 1000, created_at: Time.now - 1.hour) }
    let!(:school_2) { School.create!(name: "Walnut Hill", esl_program: true, tuition: 1500, created_at: Time.now - 2.hour) }
    let!(:school_3) { School.create!(name: "Hogwart", esl_program: true, tuition: 2500) }

      it "When I visit school index I see" do   
        visit "/schools"

        expect(school_2.name).to appear_before(school_1.name)
        expect(school_1.name).to appear_before(school_3.name)
        expect(page).to have_content(school_1.created_at)
        expect(page).to have_content(school_2.created_at)
        expect(page).to have_content(school_3.created_at)
      end   
  end

  describe "user story 8" do
    describe "When I visit '/schools'" do
      it "see a link at the top of the page that takes me to the Student Index" do
        visit "/schools"

        expect(page).to have_link(href:"/students")
      end
    end
  end

  describe "user story 9" do
    describe "When I visit '/schools'" do
      it "see a link at the top of the page that takes me to the School Index" do
        visit "/schools"

        expect(page).to have_link(href:"/schools")
      end
    end
  end
end


RSpec.describe "School Index Page", type: :feature do
  describe "As a user" do
    let!(:school_1) { School.create!(name: "Dry Creek", esl_program: false, tuition: 1000, created_at: Time.now - 1.hour) }
    let!(:school_2) { School.create!(name: "Walnut Hill", esl_program: true, tuition: 1500, created_at: Time.now - 2.hour) }
    let!(:school_3) { School.create!(name: "Hogwart", esl_program: true, tuition: 2500) }

    scenario "When I visit '/schools' I see" do
       
      visit "/schools"

      expect(page).to have_content(school_1.name)
      expect(page).to have_content(school_2.name)
      expect(school_2.name).to appear_before(school_1.name)
      expect(school_1.name).to appear_before(school_3.name)
      expect(page).to have_content(school_1.created_at)
      expect(page).to have_content(school_2.created_at)
      expect(page).to have_content(school_3.created_at)
    end   
  end
end