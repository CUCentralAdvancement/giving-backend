require 'rails_helper'

RSpec.describe "memberships/index", type: :view do
  before(:each) do
    assign(:memberships, [
      Membership.create!(
        type: ""
      ),
      Membership.create!(
        type: ""
      )
    ])
  end

  it "renders a list of memberships" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
