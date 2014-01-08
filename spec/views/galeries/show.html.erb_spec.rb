require 'spec_helper'

describe "galeries/show" do
  before(:each) do
    @galery = assign(:galery, stub_model(Galery,
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
