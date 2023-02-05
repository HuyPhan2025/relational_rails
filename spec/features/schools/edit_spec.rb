require 'rails_helper'

RSpec.describe 'User story 12' do
  let!(:school_1) { School.create!(name: "Dry Creek", esl_program: false, tuition: 1000, created_at: Time.now - 1.hour) }
  it "can edit school and redirect to '/schools/:id'" do
    visit "/schools/#{school_1.id}"

    expect(page).to have_content("Dry Creek")
    expect(page).to have_content("ESL Program: false")
    expect(page).to have_content("Tuition: 1000")
    
    click_link("Edit School")

    fill_in("Name", with: "Dry Creek")
    fill_in("ESL Program", with: true)
    fill_in("Tuition", with: 2000)
    
    click_button("Update School")

    expect(current_path).to eq("/schools/#{school_1.id}")
    expect(page).to have_content("Dry Creek")
    expect(page).to have_content("ESL Program: true")
    expect(page).to have_content("Tuition: 2000")
  end
end
