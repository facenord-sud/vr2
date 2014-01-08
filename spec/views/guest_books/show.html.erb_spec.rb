require 'spec_helper'

describe "guest_books/show" do
  before(:each) do
    @guest_book = assign(:guest_book, stub_model(GuestBook,
      :name => "Name",
      :comment => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
  end
end
