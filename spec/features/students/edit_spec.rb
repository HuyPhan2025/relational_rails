require 'rails_helper'

RSpec.describe 'User story 14' do
  it "can edit student and redirect to '/student/:id'" do
    school_1 = School.create!(name: "Dry Creek", esl_program: false, tuition: 1000)
    student_1 = Student.create!(school: school_1, name: "John Wick", english_learner: false, grade: 2)
  
    visit "/students/#{student_1.id}"
  
    expect(page).to have_content("John Wick")
    expect(page).to have_content("English Learner: false")
    expect(page).to have_content("Grade: 2")
  
    click_link("Edit Student")
  
    fill_in("Name", with: "John Wick")
    fill_in("English Learner", with: true)
    fill_in("Grade", with: 3)
  
    click_button("Update Student")

    expect(current_path).to eq("/students/#{student_1.id}")
    expect(page).to have_content("John Wick")
    expect(page).to have_content("English Learner: true")
    expect(page).to have_content("Grade: 3")
  end


end