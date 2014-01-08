require 'spec_helper'

describe "carreers/index" do
  before(:each) do
    assign(:carreers, [
      stub_model(Carreer,
        :name => "Name",
        :medals => "Medals"
      ),
      stub_model(Carreer,
        :name => "Name",
        :medals => "Medals"
      )
    ])
  end

  it "renders a list of carreers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Medals".to_s, :count => 2
  end
end
