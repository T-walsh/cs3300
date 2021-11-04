require "rails_helper"
#This spec is a hard coded example of a test intially incorrectly made
#to then be modified to be fixed. Initially the product was false at 43.
RSpec.describe "The math below is wrong..." do
  it "should equal 42 but we said 43" do
    expect(6 * 7).to eq(42)
  end
end