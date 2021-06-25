require 'rails_helper'

RSpec.describe "spaces/index", type: :view do
  before(:each) do
    assign(:spaces, [
      Space.create!(
        name: "Name",
        description: "Description",
        slug: "Slug",
        user: nil
      ),
      Space.create!(
        name: "Name",
        description: "Description",
        slug: "Slug",
        user: nil
      )
    ])
  end

  it "renders a list of spaces" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: "Slug".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
