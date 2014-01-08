require 'spec_helper'

describe "images/new" do
  before(:each) do
    assign(:image, stub_model(Image,
      :asset => "MyString",
      :legend => "MyText",
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => images_path, :method => "post" do
      assert_select "input#image_asset", :name => "image[asset]"
      assert_select "textarea#image_legend", :name => "image[legend]"
      assert_select "input#image_title", :name => "image[title]"
    end
  end
end
