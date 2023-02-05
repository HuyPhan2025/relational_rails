require 'rails_helper'

RSpec.describe '#create new Schools record' do
  describe "When I visit '/schools/:school_id/student_table_name/new'" do   
    it "can create a new student record and get redirect to '/schools/:school_id/student_table_name'" do
      school_1 = School.create!(name: "Dry Creek", esl_program: false, tuition: 1000, created_at: Time.now - 1.hour)
      visit "/schools/#{school_1.id}/students/new"

      fill_in("Name", with: "Axel Green")
      fill_in("English Learner", with: false)
      fill_in("Grade", with: 5)
      click_button("Create Student")

      expect(current_path).to eq("/schools/#{school_1.id}/students")
      expect(page).to have_content("Axel Green")
      expect(page).to have_content("English Learner: false")
      expect(page).to have_content("Grade: 5")
    end
  end
end