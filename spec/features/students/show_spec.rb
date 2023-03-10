require 'rails_helper'

RSpec.describe "Student Show page" do
  describe "As a user" do
    describe "When I visit '/child_table_name/:id'" do
      it "I see the child with that id including the child's attributes" do
        school_1 = School.create!(name: "Dry Creek", esl_program: false, tuition: 1000)

        student_1 = Student.create!(school: school_1, name: "John Wick", english_learner: false, grade: 2)
        student_2 = Student.create!(school: school_1, name: "Sara Barne", english_learner: false, grade: 4)
        
        visit "/students/#{student_1.id}"

        expect(page).to have_content(student_1.name)
        expect(page).to have_content("English Learner: #{student_1.english_learner}")
        expect(page).to have_content("Grade: #{student_1.grade}")
      end

      it "see a link at the top of the page that takes me to the Student Index" do
        school_1 = School.create!(name: "Dry Creek", esl_program: false, tuition: 1000)

        student_1 = Student.create!(school: school_1, name: "John Wick", english_learner: false, grade: 2)
        student_2 = Student.create!(school: school_1, name: "Sara Barne", english_learner: false, grade: 4)
        visit "/students/#{student_1.id}"

        expect(page).to have_link(href:"/students")
      end

      it "see a link at the top of the page that takes me to the School Index" do
        school_1 = School.create!(name: "Dry Creek", esl_program: false, tuition: 1000)

        student_1 = Student.create!(school: school_1, name: "John Wick", english_learner: false, grade: 2)
        student_2 = Student.create!(school: school_1, name: "Sara Barne", english_learner: false, grade: 4)
        visit "/students/#{student_1.id}"

        expect(page).to have_link(href:"/schools")
      end

      it "I see a link to update that Student 'Update Student' and click the link take me to '/student_table_name/:id/edit'" do
        school_1 = School.create!(name: "Dry Creek", esl_program: false, tuition: 1000)

        student_1 = Student.create!(school: school_1, name: "John Wick", english_learner: false, grade: 2)
        student_2 = Student.create!(school: school_1, name: "Sara Barne", english_learner: false, grade: 4)
        visit "/students/#{student_1.id}"

        expect(page).to have_link("Edit Student")
        click_link("Edit Student")
        expect(current_path).to eq("/students/#{student_1.id}/edit")
      end

      it "see a link to delete Student" do
        school_1 = School.create!(name: "Dry Creek", esl_program: false, tuition: 1000)

        student_1 = Student.create!(school: school_1, name: "John Wick", english_learner: false, grade: 2)
        student_2 = Student.create!(school: school_1, name: "Sara Barne", english_learner: false, grade: 4)
        visit "/students/#{student_1.id}"

        expect(page).to have_link("Delete Student")
        click_link("Delete Student")
        expect(current_path).to eq("/students")
        expect(page).to have_content(student_2.name)
        expect(page).to_not have_content(student_1.name)
      end

    end
  end
end