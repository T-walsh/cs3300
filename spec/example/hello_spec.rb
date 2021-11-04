require "rails_helper"

RSpec.describe "hello spec" do
  # This spec tests that the string is empty
  describe String do
    let(:string) { String.new } #since no params this test will always succeed
    it "should provide an empty string" do
      expect(string).to eq("")
    end
  end
 end