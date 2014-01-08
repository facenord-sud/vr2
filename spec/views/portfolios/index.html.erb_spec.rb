require 'spec_helper'

describe "portfolios/index" do
  before(:each) do
    assign(:portfolios, [
      stub_model(Portfolio,
        :image => "Image",
        :description => "MyText"
      ),
      stub_model(Portfolio,
        :image => "Image",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of portfolios" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
