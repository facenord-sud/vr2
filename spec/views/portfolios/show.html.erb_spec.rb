require 'spec_helper'

describe "portfolios/show" do
  before(:each) do
    @portfolio = assign(:portfolio, stub_model(Portfolio,
      :image => "Image",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Image/)
    rendered.should match(/MyText/)
  end
end
