require 'rails_helper'

RSpec.describe "funds/edit", type: :view do
  before(:each) do
    @fund = assign(:fund, Fund.create!(
      title: "MyString",
      description: "MyString",
      allocation_code: "MyString",
      campus: "MyString",
      keywords: "MyString",
      interest: "MyString",
      suggested_amount: 1,
      content: "MyString"
    ))
  end

  it "renders the edit fund form" do
    render

    assert_select "form[action=?][method=?]", fund_path(@fund), "post" do

      assert_select "input[name=?]", "fund[title]"

      assert_select "input[name=?]", "fund[description]"

      assert_select "input[name=?]", "fund[allocation_code]"

      assert_select "input[name=?]", "fund[campus]"

      assert_select "input[name=?]", "fund[keywords]"

      assert_select "input[name=?]", "fund[interest]"

      assert_select "input[name=?]", "fund[suggested_amount]"

      assert_select "input[name=?]", "fund[content]"
    end
  end
end
