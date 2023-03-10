require 'rails_helper'

RSpec.describe 'schools show page' do
  describe "As a user" do
    describe "When I visit '/schools/:id'" do
      it "I see the school with that id including the school's attributes" do
        school_1 = School.create!(name: "Dry Creek", esl_program: false, tuition: 1000)
        
        visit "/schools/#{school_1.id}"

        expect(page).to have_content(school_1.name)
        expect(page).to have_content("ESL Program: #{school_1.esl_program}")
        expect(page).to have_content("Tuition: #{school_1.tuition}")
      end
    end

    describe "User story 7"  do
      let!(:school_1) { School.create!(name: "Dry Creek", esl_program: false, tuition: 1000, created_at: Time.now - 1.hour) }
  
      let!(:student_1) {Student.create!(school: school_1, name: "John Wick", english_learner: false, grade: 2)}
      let!(:student_2) {Student.create!(school: school_1, name: "Sara Barne", english_learner: false, grade: 4)}
      let!(:student_3) {Student.create!(school: school_1, name: "Kim Lee", english_learner: true, grade: 1)}
      
      it "When I visit a school's show page I see" do

        visit "/schools/#{school_1.id}"

        expect(page).to have_content("Number of students: #{school_1.count_of_students}")
      end
    end

    describe "user story 8" do
      let!(:school_1) { School.create!(name: "Dry Creek", esl_program: false, tuition: 1000, created_at: Time.now - 1.hour) }

      let!(:student_1) {Student.create!(school: school_1, name: "John Wick", english_learner: false, grade: 2)}
      let!(:student_2) {Student.create!(school: school_1, name: "Sara Barne", english_learner: false, grade: 4)}
      let!(:student_3) {Student.create!(school: school_1, name: "Kim Lee", english_learner: true, grade: 1)}
      describe "When I visit '/schools'" do
        it "see a link at the top of the page that takes me to the Student Index" do

          visit "/schools/#{school_1.id}"
  
          expect(page).to have_link(href:"/students")
        end
      end   
    end

    describe "user story 9" do
      let!(:school_1) { School.create!(name: "Dry Creek", esl_program: false, tuition: 1000, created_at: Time.now - 1.hour) }

      let!(:student_1) {Student.create!(school: school_1, name: "John Wick", english_learner: false, grade: 2)}
      let!(:student_2) {Student.create!(school: school_1, name: "Sara Barne", english_learner: false, grade: 4)}
      let!(:student_3) {Student.create!(school: school_1, name: "Kim Lee", english_learner: true, grade: 1)}
      describe "When I visit '/schools'" do
        it "see a link at the top of the page that takes me to the School Index" do

          visit "/schools/#{school_1.id}"
  
          expect(page).to have_link(href:"/schools")
        end
      end
    end

    describe "user story 10" do
      let!(:school_1) { School.create!(name: "Dry Creek", esl_program: false, tuition: 1000, created_at: Time.now - 1.hour) }

      let!(:student_1) {Student.create!(school: school_1, name: "John Wick", english_learner: false, grade: 2)}
      let!(:student_2) {Student.create!(school: school_1, name: "Sara Barne", english_learner: false, grade: 4)}
      let!(:student_3) {Student.create!(school: school_1, name: "Kim Lee", english_learner: true, grade: 1)}
      describe "When I visit '/schools/:id'" do
        it "see a link at the top of the page that takes me to the School's `child_table_name` page" do

          visit "/schools/#{school_1.id}"
  
          expect(page).to have_link("School Student", href:"/schools/#{school_1.id}/students")
        end
      end
    end

    describe "User story 12" do
      let!(:school_1) { School.create!(name: "Dry Creek", esl_program: false, tuition: 1000, created_at: Time.now - 1.hour) }
      describe "When I visit '/schools/:id'" do
        it "I see a link to update the school 'Update School' and click the link take me to '/parents/:id/edit'" do
          visit "/schools/#{school_1.id}"

          expect(page).to have_link("Edit School")
          click_link("Edit School")
          expect(current_path).to eq("/schools/#{school_1.id}/edit")
        end
      end
    end

    describe "User story 19" do
      describe "When I visit '/schools/:id'" do
        it "see a link to delete the parent" do
          school_1 = School.create!(name: "Dry Creek", esl_program: true, tuition: 1000, created_at: Time.now - 1.hour)
          school_2 = School.create!(name: "Walnut Hill", esl_program: true, tuition: 1500,created_at: Time.now - 2.hour)
          visit "/schools/#{school_1.id}"

          expect(page).to have_link("Delete School")
          click_link("Delete School")
          expect(current_path).to eq("/schools")
          expect(page).to have_content(school_2.name)
          expect(page).to_not have_content(school_1.name)
        end
      end
    end
  end
end

# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent