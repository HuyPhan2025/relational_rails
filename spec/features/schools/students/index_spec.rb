# User Story 5, Parent Children Index 

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)

require 'rails_helper'

RSpec.describe "Parent Children Index" do
  describe "As a user" do
    describe "When I visit '/schools/:school_id/student_table_name'" do
      it "I see each Child that is associated with that Parent with each Child's attributes" do
        school_1 = School.create!(name: "Dry Creek", esl_program: false, tuition: 1000)

        student_1 = Student.create!(school: school_1, name: "John Wick", english_learner: false, grade: 2)
        student_2 = Student.create!(school: school_1, name: "Sara Barne", english_learner: false, grade: 4)

        visit "/schools/#{school_1.id}/students"

        expect(page).to have_content(school_1.name)
        expect(page).to have_content(student_1.name)
        expect(page).to have_content(student_2.name)
        expect(page).to have_content("English Learner: #{student_1.english_learner}")
        expect(page).to have_content("Grade: #{student_1.grade}")
        expect(page).to have_content("English Learner: #{student_2.english_learner}")
        expect(page).to have_content("Grade: #{student_2.grade}")
      end

      describe "user story 8" do
        describe "When I visit '/schools/:school_id/student_table_name'" do
          it "see a link at the top of the page that takes me to the Student Index" do
            school_1 = School.create!(name: "Dry Creek", esl_program: false, tuition: 1000)

            student_1 = Student.create!(school: school_1, name: "John Wick", english_learner: false, grade: 2)
            student_2 = Student.create!(school: school_1, name: "Sara Barne", english_learner: false, grade: 4)

            visit "/schools/#{school_1.id}/students"
    
            expect(page).to have_link(href:"/students")
          end
        end
      end

      describe "user story 9" do
        describe "When I visit '/schools/:school_id/student_table_name'" do
          it "see a link at the top of the page that takes me to the School Index" do
            school_1 = School.create!(name: "Dry Creek", esl_program: false, tuition: 1000)

            student_1 = Student.create!(school: school_1, name: "John Wick", english_learner: false, grade: 2)
            student_2 = Student.create!(school: school_1, name: "Sara Barne", english_learner: false, grade: 4)

            visit "/schools/#{school_1.id}/students"
    
            expect(page).to have_link(href:"/schools")
          end
        end
      end
    end    
  end
end
