require 'rails_helper'

RSpec.describe "funds/index", type: :view do
  before(:each) do
    assign(:funds, [
      Fund.create!(
        title: "Title",
        description: "Description",
        allocation_code: "Allocation Code",
        campus: "Campus",
        keywords: "Keywords",
        interest: "Interest",
        suggested_amount: 2,
        content: "Marketing Content"
      ),
      Fund.create!(
        title: "Title",
        description: "Description",
        allocation_code: "Allocation Code",
        campus: "Campus",
        keywords: "Keywords",
        interest: "Interest",
        suggested_amount: 2,
        content: "Marketing Content"
      )
    ])
  end

  it "renders a list of funds" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: "Allocation Code".to_s, count: 2
    assert_select "tr>td", text: "Campus".to_s, count: 2
    assert_select "tr>td", text: "Keywords".to_s, count: 2
    assert_select "tr>td", text: "Interest".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Marketing Content".to_s, count: 2
  end
end
