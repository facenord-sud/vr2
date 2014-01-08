require 'spec_helper'

describe "carreers/new" do
  before(:each) do
    assign(:carreer, stub_model(Carreer,
      :name => "MyString",
      :medals => "MyString"
    ).as_new_record)
  end

  it "renders new carreer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => carreers_path, :method => "post" do
      assert_select "input#carreer_name", :name => "carreer[name]"
      assert_select "input#carreer_medals", :name => "carreer[medals]"
    end
  end
end
