require 'spec_helper'

describe "carreers/edit" do
  before(:each) do
    @carreer = assign(:carreer, stub_model(Carreer,
      :name => "MyString",
      :medals => "MyString"
    ))
  end

  it "renders the edit carreer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => carreers_path(@carreer), :method => "post" do
      assert_select "input#carreer_name", :name => "carreer[name]"
      assert_select "input#carreer_medals", :name => "carreer[medals]"
    end
  end
end
