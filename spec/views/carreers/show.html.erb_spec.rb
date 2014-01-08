require 'spec_helper'

describe "carreers/show" do
  before(:each) do
    @carreer = assign(:carreer, stub_model(Carreer,
      :name => "Name",
      :medals => "Medals"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Medals/)
  end
end
