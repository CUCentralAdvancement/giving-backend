require 'rails_helper'

RSpec.describe "funds/new", type: :view do
  before(:each) do
    assign(:fund, Fund.new(
      title: "MyString",
      description: "MyString",
      allocation_code: "MyString",
      campus: "MyString",
      keywords: "MyString",
      interest: "MyString",
      suggested_amount: 1,
      marketing_content: "MyString"
    ))
  end

  it "renders new fund form" do
    render

    assert_select "form[action=?][method=?]", funds_path, "post" do

      assert_select "input[name=?]", "fund[title]"

      assert_select "input[name=?]", "fund[description]"

      assert_select "input[name=?]", "fund[allocation_code]"

      assert_select "input[name=?]", "fund[campus]"

      assert_select "input[name=?]", "fund[keywords]"

      assert_select "input[name=?]", "fund[interest]"

      assert_select "input[name=?]", "fund[suggested_amount]"

      assert_select "input[name=?]", "fund[marketing_content]"
    end
  end
end
