require 'rails_helper'

RSpec.describe "redirects/index", type: :view do
  before(:each) do
    assign(:redirects, [
      Redirect.create!(
        source: "Source",
        redirect: "Redirect",
        status: 2
      ),
      Redirect.create!(
        source: "Source",
        redirect: "Redirect",
        status: 2
      )
    ])
  end

  it "renders a list of redirects" do
    render
    assert_select "tr>td", text: "Source".to_s, count: 2
    assert_select "tr>td", text: "Redirect".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
