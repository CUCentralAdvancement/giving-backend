require 'rails_helper'

RSpec.describe "spaces/show", type: :view do
  before(:each) do
    @space = assign(:space, Space.create!(
      name: "Name",
      description: "Description",
      slug: "Slug",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(//)
  end
end
