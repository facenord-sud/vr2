require 'spec_helper'

describe "images/edit" do
  before(:each) do
    @image = assign(:image, stub_model(Image,
      :asset => "MyString",
      :legend => "MyText",
      :title => "MyString"
    ))
  end

  it "renders the edit image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => images_path(@image), :method => "post" do
      assert_select "input#image_asset", :name => "image[asset]"
      assert_select "textarea#image_legend", :name => "image[legend]"
      assert_select "input#image_title", :name => "image[title]"
    end
  end
end
