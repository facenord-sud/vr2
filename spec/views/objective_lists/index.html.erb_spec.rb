require 'spec_helper'

describe "objective_lists/index" do
  before(:each) do
    assign(:objective_lists, [
      stub_model(ObjectiveList),
      stub_model(ObjectiveList)
    ])
  end

  it "renders a list of objective_lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
