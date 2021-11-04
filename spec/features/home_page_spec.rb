require 'rails_helper'
#this feature was made from the command line and automatically 
#input with rudamentary code that was changed for our purposes
RSpec.feature "Visiting the homepage", type: :feature do
  scenario "The visitor should see projects" do
    visit root_path
    expect(page).to have_text("Projects")
  end
end
