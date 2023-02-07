require 'rails_helper'

RSpec.describe "Parent Children Index" do
  describe "As a user" do
    describe "When I visit '/schools/:school_id/student_table_name'" do
      it "I see each Child that is associated with that Parent with each Child's attributes" do
        school_1 = School.create!(name: "Dry Creek", esl_program: false, tuition: 1000)

        student_1 = Student.create!(school: school_1, name: "John Wick", english_learner: true, grade: 2)
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

      describe "user story 13" do
        describe "When I visit '/schools/:school_id/student_table_name'" do
          it "I see a link to create a new student and click link take me to the new page" do
            school_1 = School.create!(name: "Dry Creek", esl_program: false, tuition: 1000)

            student_1 = Student.create!(school: school_1, name: "John Wick", english_learner: false, grade: 2)
            student_2 = Student.create!(school: school_1, name: "Sara Barne", english_learner: false, grade: 4)

            visit "/schools/#{school_1.id}/students"

            expect(page).to have_link("Create Student")
            click_link("Create Student")
            expect(current_path).to eq("/schools/#{school_1.id}/students/new")
          end
        end
      end

      describe "user story 16" do
        describe "When I visit the School's students Index Page" do
          it "see a link to sort children in alphabetical order" do
            school_1 = School.create!(name: "Dry Creek", esl_program: false, tuition: 1000)

            student_1 = Student.create!(school: school_1, name: "John Wick", english_learner: false, grade: 2)
            student_2 = Student.create!(school: school_1, name: "Sara Barne", english_learner: false, grade: 4)
            student_3 = Student.create!(school: school_1, name: "Kim Lee", english_learner: true, grade: 1)
            visit "/schools/#{school_1.id}/students"

            expect(page).to have_content(student_1.name)
            expect(page).to have_content("English Learner: #{student_1.english_learner}")
            expect(page).to have_content("Grade: #{student_1.grade}")
            expect(page).to have_content(student_2.name)
            expect(page).to have_content("English Learner: #{student_2.english_learner}")
            expect(page).to have_content("Grade: #{student_2.grade}")
            expect(page).to have_content(student_3.name)
            expect(page).to have_content("English Learner: #{student_3.english_learner}")
            expect(page).to have_content("Grade: #{student_3.grade}")

            click_link("Order Alphabetically")

            expect(current_path).to eq("/schools/#{school_1.id}/students")
            expect(page).to have_content(student_3.name)
            expect(page).to have_content("English Learner: #{student_3.english_learner}")
            expect(page).to have_content("Grade: #{student_3.grade}")
            expect(page).to have_content(student_1.name)
            expect(page).to have_content("English Learner: #{student_1.english_learner}")
            expect(page).to have_content("Grade: #{student_1.grade}")
            expect(page).to have_content(student_2.name)
            expect(page).to have_content("English Learner: #{student_2.english_learner}")
            expect(page).to have_content("Grade: #{student_2.grade}")
          end
        end
        
      end

      describe "user story 18" do
        describe "When I visit '/schools/:school_id/students'" do
          it "see a link to edit the Student info" do
            school_1 = School.create!(name: "Dry Creek", esl_program: false, tuition: 1000)
    
            student_1 = Student.create!(school: school_1, name: "John Wick", english_learner: false, grade: 2)
            student_2 = Student.create!(school: school_1, name: "Sara Barne", english_learner: false, grade: 4)
            visit "/schools/#{school_1.id}/students"
    
            within "#John" do
              expect(page).to have_link("Edit Student", href: "/students/#{student_1.id}/edit")
              click_link("Edit Student")
            end

            expect(current_path).to eq("/students/#{student_1.id}/edit")
          end
        end
      end

      describe "user story 21" do
        describe "When I visit the School's student Index Page" do
          it "see a form that allows me to input a number value" do
            school_1 = School.create!(name: "Dry Creek", esl_program: false, tuition: 1000)
    
            student_1 = Student.create!(school: school_1, name: "John Wick", english_learner: false, grade: 2)
            student_2 = Student.create!(school: school_1, name: "Sara Barne", english_learner: false, grade: 4)
            visit "/schools/#{school_1.id}/students"

            fill_in("Student Grade", with: 3)
            click_button("filter")

            expect(current_path).to eq("/schools/#{school_1.id}/students/filter")
            expect(page).to have_content(student_2.name)
          end
        end
      end

      describe "user story 23" do
        describe "When I visit the `student` index page" do
          it "Next to every student, I see a link to delete that student" do
            school_1 = School.create!(name: "Dry Creek", esl_program: false, tuition: 1000)
    
            student_1 = Student.create!(school: school_1, name: "John Wick", english_learner: false, grade: 2)
            student_2 = Student.create!(school: school_1, name: "Sara Barne", english_learner: false, grade: 4)
            visit "/schools/#{school_1.id}/students"

            expect(page).to have_link("Delete Student #{student_1.name}")
            click_link("Delete Student #{student_1.name}")
            expect(current_path).to eq("/students")
            expect(page).to have_content(student_2.name)
            expect(page).to_not have_content(student_1.name)
          end
        end
      end
    end  
  end
end
