require 'rails_helper'

RSpec.describe '#create new Schools record' do
  describe 'when I visit "/schools/new"' do
    it 'can create a new school record and get redirect to school index page' do
      visit '/schools/new'

      fill_in("Name", with: "Lone Tree")
      fill_in("ESL Program", with: false)
      fill_in("Tuition", with: 750)
      click_button("Create School")
      
      expect(current_path).to eq('/schools')
      expect(page).to have_content("Lone Tree")
    end
  end
end