# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

require 'rails_helper'

RSpec.describe '#create new Schools record' do
  describe 'when I visit "/schools/new"' do
    it 'can create a new school record and get redirect to school index page' do
      visit '/schools/new'

      fill_in("Name", with: "Lone Tree" )
      fill_in("ESL Program", with: false)
      fill_in("Tuition", with: 750)
      click_button("Create School")
      expect(current_path).to eq('/schools')
      expect(page).to have_content("Lone Tree")
    end
  end
end