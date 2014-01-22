require 'spec_helper'

describe "objective_lists/edit" do
  before(:each) do
    @objective_list = assign(:objective_list, stub_model(ObjectiveList))
  end

  it "renders the edit objective_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => objective_lists_path(@objective_list), :method => "post" do
    end
  end
end
