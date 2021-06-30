require 'rails_helper'

RSpec.describe "spaces/edit", type: :view do
  before(:each) do
    @space = assign(:space, Space.create!(
      name: "MyString",
      description: "MyString",
      slug: "MyString",
      user: nil
    ))
  end

  it "renders the edit space form" do
    render

    assert_select "form[action=?][method=?]", space_path(@space), "post" do

      assert_select "input[name=?]", "space[name]"

      assert_select "input[name=?]", "space[description]"

      assert_select "input[name=?]", "space[slug]"

      assert_select "input[name=?]", "space[user_id]"
    end
  end
end
