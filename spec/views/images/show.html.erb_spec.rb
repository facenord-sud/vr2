require 'spec_helper'

describe "images/show" do
  before(:each) do
    @image = assign(:image, stub_model(Image,
      :asset => "Asset",
      :legend => "MyText",
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Asset/)
    rendered.should match(/MyText/)
    rendered.should match(/Title/)
  end
end
