require 'rails_helper'

RSpec.describe "funds/show", type: :view do
  before(:each) do
    @fund = assign(:fund, Fund.create!(
      title: "Title",
      description: "Description",
      allocation_code: "Allocation Code",
      campus: "Campus",
      keywords: "Keywords",
      interest: "Interest",
      suggested_amount: 2,
      marketing_content: "Marketing Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Allocation Code/)
    expect(rendered).to match(/Campus/)
    expect(rendered).to match(/Keywords/)
    expect(rendered).to match(/Interest/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Marketing Content/)
  end
end
