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

    describe "User story 7"  do
      let!(:school_1) { School.create!(name: "Dry Creek", esl_program: false, tuition: 1000, created_at: Time.now - 1.hour) }
  
      let!(:student_1) {Student.create!(school: school_1, name: "John Wick", english_learner: false, grade: 2)}
      let!(:student_2) {Student.create!(school: school_1, name: "Sara Barne", english_learner: false, grade: 4)}
      let!(:student_3) {Student.create!(school: school_1, name: "Kim Lee", english_learner: true, grade: 1)}
      
      it "When I visit a parent's show page I see" do

        visit "/schools/#{school_1.id}"

        expect(page).to have_content("Number of students: #{school_1.count_of_students}")
      end
    end
  end
end