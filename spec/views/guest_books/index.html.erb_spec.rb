require 'spec_helper'

describe "guest_books/index" do
  before(:each) do
    assign(:guest_books, [
      stub_model(GuestBook,
        :name => "Name",
        :comment => "MyText"
      ),
      stub_model(GuestBook,
        :name => "Name",
        :comment => "MyText"
      )
    ])
  end

  it "renders a list of guest_books" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
