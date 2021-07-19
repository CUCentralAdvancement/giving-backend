require 'rails_helper'

RSpec.describe "memberships/new", type: :view do
  before(:each) do
    assign(:membership, Membership.new(
      type: ""
    ))
  end

  it "renders new membership form" do
    render

    assert_select "form[action=?][method=?]", memberships_path, "post" do

      assert_select "input[name=?]", "membership[type]"
    end
  end
end
