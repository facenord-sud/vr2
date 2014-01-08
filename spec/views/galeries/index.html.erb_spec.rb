require 'spec_helper'

describe "galeries/index" do
  before(:each) do
    assign(:galeries, [
      stub_model(Galery,
        :title => "Title",
        :description => "MyText"
      ),
      stub_model(Galery,
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of galeries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
