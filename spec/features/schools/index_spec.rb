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

        expect(school_1.name).to appear_before(school_2.name)
        expect(school_2.name).to appear_before(school_3.name)
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

  describe "user story 11" do
    describe "When I visit '/schools'" do
      it "I see a link to create a new school record and click link to go to new page" do
        visit "/schools"

        expect(page).to have_link("Create School")
        click_link("Create School")
        expect(current_path).to eq("/schools/new")
      end
    end
  end

  describe "user story 17" do
    describe "When I visit '/schools'" do
    let!(:school_1) { School.create!(name: "Dry Creek", esl_program: false, tuition: 1000, created_at: Time.now - 1.hour) }

      it "I see a link to edit that parent's info next to every school and click the link take me to the edit page" do
        visit "/schools"

        expect(page).to have_link("Edit School")
        click_link("Edit School")
        expect(current_path).to eq("/schools/#{school_1.id}/edit")
      end
    end
  end

  describe "user story 22" do
    describe "When I visit '/schools'" do
      it "Next to every parent, I see a link to delete that parent" do
        school_1 = School.create!(name: "Dry Creek", esl_program: true, tuition: 1000, created_at: Time.now - 1.hour)
        school_2 = School.create!(name: "Walnut Hill", esl_program: true, tuition: 1500,created_at: Time.now - 2.hour)
        visit "/schools"

        expect(page).to have_link("Delete School #{school_1.name}")
        click_link("Delete School #{school_1.name}")
        expect(current_path).to eq("/schools")
        expect(page).to have_content(school_2.name)
        expect(page).to_not have_content(school_1.name)
      end
    end
  end
end


# RSpec.describe "School Index Page", type: :feature do
#   describe "As a user" do
#     let!(:school_1) { School.create!(name: "Dry Creek", esl_program: false, tuition: 1000, created_at: Time.now - 1.hour) }
#     let!(:school_2) { School.create!(name: "Walnut Hill", esl_program: true, tuition: 1500, created_at: Time.now - 2.hour) }
#     let!(:school_3) { School.create!(name: "Hogwart", esl_program: true, tuition: 2500) }

#     scenario "When I visit '/schools' I see" do
       
#       visit "/schools"

#       expect(page).to have_content(school_1.name)
#       expect(page).to have_content(school_2.name)
#       expect(school_2.name).to appear_before(school_1.name)
#       expect(school_1.name).to appear_before(school_3.name)
#       expect(page).to have_content(school_1.created_at)
#       expect(page).to have_content(school_2.created_at)
#       expect(page).to have_content(school_3.created_at)
#     end   
#   end
# end