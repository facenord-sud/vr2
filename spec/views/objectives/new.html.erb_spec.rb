require 'spec_helper'

describe "objectives/new" do
  before(:each) do
    assign(:objective, stub_model(Objective,
      :name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new objective form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => objectives_path, :method => "post" do
      assert_select "input#objective_name", :name => "objective[name]"
      assert_select "input#objective_description", :name => "objective[description]"
    end
  end
end
