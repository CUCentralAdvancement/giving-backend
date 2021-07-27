require 'rails_helper'

RSpec.describe "redirects/show", type: :view do
  before(:each) do
    @redirect = assign(:redirect, Redirect.create!(
      source: "Source",
      redirect: "Redirect",
      status: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Source/)
    expect(rendered).to match(/Redirect/)
    expect(rendered).to match(/2/)
  end
end
