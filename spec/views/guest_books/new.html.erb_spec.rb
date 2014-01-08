require 'spec_helper'

describe "guest_books/new" do
  before(:each) do
    assign(:guest_book, stub_model(GuestBook,
      :name => "MyString",
      :comment => "MyText"
    ).as_new_record)
  end

  it "renders new guest_book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => guest_books_path, :method => "post" do
      assert_select "input#guest_book_name", :name => "guest_book[name]"
      assert_select "textarea#guest_book_comment", :name => "guest_book[comment]"
    end
  end
end
