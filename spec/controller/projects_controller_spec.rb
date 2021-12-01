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

    # This should return the minimal set of attributes required to create a valid
    # Article. As you add validations to Article, be sure to adjust the attributes here as well.
  let(:valid_attributes) {
      { :title => "Test title!", :description => "This is a test description"}
  }

  let(:valid_session) { {} }

  describe "GET #index" do
      it "returns a success response" do
          Project.create! valid_attributes
          get :index, params: {}, session: valid_session
          expect(response).to be_successful # be_successful expects a HTTP Status code of 200
          #expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
      end
  end
end