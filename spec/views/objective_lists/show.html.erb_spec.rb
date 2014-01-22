require 'spec_helper'

describe "objective_lists/show" do
  before(:each) do
    @objective_list = assign(:objective_list, stub_model(ObjectiveList))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
