require 'spec_helper'

describe "objective_lists/new" do
  before(:each) do
    assign(:objective_list, stub_model(ObjectiveList).as_new_record)
  end

  it "renders new objective_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => objective_lists_path, :method => "post" do
    end
  end
end
