require "rails_helper"

RSpec.describe Project, type: :model do
  context "validations tests" do #validates the presence of an entity
    it "ensures the title is present" do
      project = Project.new(description: "Content of the description")
      expect(project.valid?).to eq(false) #if no content in title, this test would succeed if there is an
                                          #error already raised when trying to input a project with no title
    end

    #this is the success case that gives a valid project and expects to save it successfully
    it "should be able to save project" do
      project = Project.new(title: "Title", description: "Some description content goes here")
      expect(project.save).to eq(true)
    end
    #if an error is not raised when there is no description as stated in this spec
    #then this test fails
    it "ensures the description is present" do
        project = Project.new(title: "Title") #statement that the description is not apart of this project object
        expect(project.valid?).to eq(false) #ensures the app cannot go on if no description
    end

    context "scopes tests" do
        let(:params) { { title: "Title", description: "some description" } }
        before(:each) do
          Project.create(params)
          Project.create(params)
          Project.create(params)
        end
    
        it "should return all projects" do
          expect(Project.count).to eq(3)
        end
    
      end
  end

  context "scopes tests" do

  end
end