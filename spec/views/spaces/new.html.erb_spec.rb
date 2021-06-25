require 'rails_helper'

RSpec.describe "spaces/new", type: :view do
  before(:each) do
    assign(:space, Space.new(
      name: "MyString",
      description: "MyString",
      slug: "MyString",
      user: nil
    ))
  end

  it "renders new space form" do
    render

    assert_select "form[action=?][method=?]", spaces_path, "post" do

      assert_select "input[name=?]", "space[name]"

      assert_select "input[name=?]", "space[description]"

      assert_select "input[name=?]", "space[slug]"

      assert_select "input[name=?]", "space[user_id]"
    end
  end
end
