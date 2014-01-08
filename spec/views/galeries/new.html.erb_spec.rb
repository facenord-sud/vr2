require 'spec_helper'

describe "galeries/new" do
  before(:each) do
    assign(:galery, stub_model(Galery,
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new galery form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => galeries_path, :method => "post" do
      assert_select "input#galery_title", :name => "galery[title]"
      assert_select "textarea#galery_description", :name => "galery[description]"
    end
  end
end
