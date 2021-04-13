require 'rails_helper'

RSpec.describe "faqs/index", type: :view do
  before(:each) do
    assign(:faqs, [
      Faq.create!(
        title: "Title",
        slug: "Slug",
        category: 2
      ),
      Faq.create!(
        title: "Title",
        slug: "Slug",
        category: 2
      )
    ])
  end

  it "renders a list of faqs" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Slug".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
