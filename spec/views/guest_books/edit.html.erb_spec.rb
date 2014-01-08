require 'spec_helper'

describe "guest_books/edit" do
  before(:each) do
    @guest_book = assign(:guest_book, stub_model(GuestBook,
      :name => "MyString",
      :comment => "MyText"
    ))
  end

  it "renders the edit guest_book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => guest_books_path(@guest_book), :method => "post" do
      assert_select "input#guest_book_name", :name => "guest_book[name]"
      assert_select "textarea#guest_book_comment", :name => "guest_book[comment]"
    end
  end
end
