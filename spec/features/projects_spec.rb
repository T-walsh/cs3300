require 'rails_helper'
require 'support/controller_macros'
#this spec has 5 tests that asses whether a project can be created, destroyed, and updated
RSpec.feature "Projects", type: :feature do
  #context for the next three tests is in regards to creating
  context "Create new project" do
    before(:each) do
      visit new_project_path #visits the page given from this path
      within("form") do
        fill_in "Title", with: "Test title" #puts "Test title" into title form before each test to make sure the title form is always filled
      end
    end
    #this tests the ability to create a project by the resultant page having the content:"Project was successfully created"
    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      click_button "Create Project"
      expect(page).to have_content("Project was successfully created")
    end
    #makes sure there is an error raised when the description is blank
    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end
  end
  #all tests to make sure updating is working
  context "Update project" do
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do
      visit edit_project_path(project) #the following tests assess the content at this page
    end
    #expects success when updating by the page having the content: "Project was successfully updated"
    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content"
      end
      click_button "Update Project"
      expect(page).to have_content("Project was successfully updated")
    end
    #test to make sure the project isnt updated if description is empty
    scenario "should fail" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end
  #removal tests 
  context "Remove existing project" do
    let!(:project) { Project.create(title: "Test title", description: "Test content") } #creates test project to remove
    scenario "remove project" do
      visit projects_path
      click_link "Destroy"
      expect(page).to have_content("Project was successfully destroyed") #the content that states the success of the removal
      expect(Project.count).to eq(0) #tests that the amount of projects is 0 as to say the project created was immediately removed correctly
    end
  end
end