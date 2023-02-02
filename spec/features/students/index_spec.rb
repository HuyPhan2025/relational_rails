require 'rails_helper'

RSpec.describe 'Student Index page' do
  describe "As a user" do
    describe "When I visit '/child_table_name'" do
      it "I see each Child in the system including the Child's attributes" do
        school_1 = School.create!(name: "Dry Creek", esl_program: false, tuition: 1000)

        student_1 = Student.create!(school: school_1, name: "John Wick", english_learner: false, grade: 2)
        student_2 = Student.create!(school: school_1, name: "Sara Barne", english_learner: false, grade: 4)

        visit "/students/"

        expect(page).to have_content(student_1.name)
        expect(page).to have_content(student_2.name)
        expect(page).to have_content("English Learner: #{student_1.english_learner}")
        expect(page).to have_content("English Learner: #{student_2.english_learner}")
        expect(page).to have_content("Grade: #{student_1.grade}")
        expect(page).to have_content("Grade: #{student_2.grade}")
      end
    end
  end
end