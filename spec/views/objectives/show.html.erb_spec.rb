require 'spec_helper'

describe "objectives/show" do
  before(:each) do
    @objective = assign(:objective, stub_model(Objective,
      :name => "Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Description/)
  end
end
