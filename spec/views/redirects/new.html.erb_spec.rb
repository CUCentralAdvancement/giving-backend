require 'rails_helper'

RSpec.describe "redirects/new", type: :view do
  before(:each) do
    assign(:redirect, Redirect.new(
      source: "MyString",
      redirect: "MyString",
      status: 1
    ))
  end

  it "renders new redirect form" do
    render

    assert_select "form[action=?][method=?]", redirects_path, "post" do

      assert_select "input[name=?]", "redirect[source]"

      assert_select "input[name=?]", "redirect[redirect]"

      assert_select "input[name=?]", "redirect[status]"
    end
  end
end
