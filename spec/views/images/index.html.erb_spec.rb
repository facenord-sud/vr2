require 'spec_helper'

describe "images/index" do
  before(:each) do
    assign(:images, [
      stub_model(Image,
        :asset => "Asset",
        :legend => "MyText",
        :title => "Title"
      ),
      stub_model(Image,
        :asset => "Asset",
        :legend => "MyText",
        :title => "Title"
      )
    ])
  end

  it "renders a list of images" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Asset".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
