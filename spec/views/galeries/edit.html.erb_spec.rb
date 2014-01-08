require 'spec_helper'

describe "galeries/edit" do
  before(:each) do
    @galery = assign(:galery, stub_model(Galery,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit galery form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => galeries_path(@galery), :method => "post" do
      assert_select "input#galery_title", :name => "galery[title]"
      assert_select "textarea#galery_description", :name => "galery[description]"
    end
  end
end
