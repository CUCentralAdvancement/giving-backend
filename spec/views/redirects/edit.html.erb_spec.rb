require 'rails_helper'

RSpec.describe "redirects/edit", type: :view do
  before(:each) do
    @redirect = assign(:redirect, Redirect.create!(
      source: "MyString",
      redirect: "MyString",
      status: 1
    ))
  end

  it "renders the edit redirect form" do
    render

    assert_select "form[action=?][method=?]", redirect_path(@redirect), "post" do

      assert_select "input[name=?]", "redirect[source]"

      assert_select "input[name=?]", "redirect[redirect]"

      assert_select "input[name=?]", "redirect[status]"
    end
  end
end
