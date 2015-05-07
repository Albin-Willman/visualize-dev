require 'rails_helper'

RSpec.describe "features/show", type: :view do
  before(:each) do
    @feature = assign(:feature, Feature.create!(
      :name => "Name",
      :project => nil,
      :min_days => 1,
      :max_days => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
