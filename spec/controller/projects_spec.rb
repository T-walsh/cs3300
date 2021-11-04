require "rails_helper"
#Controller rspec for the projects
RSpec.describe ProjectsController, type: :controller do
  context "GET #index" do #gets index and if there is any response then this test passes
    it "returns a success response" do
      get :index
      # expect(response.success).to eq(true)
      expect(response).to be_success #above line commented out because they are equivalent
    end
  end

  context "GET #show" do #tests if show is executed successfully
    let!(:project) { Project.create(title: "Test title", description: "Test description") }
    it "returns a success response" do
      get :show, params: { id: project }
      expect(response).to be_success
    end
  end
end