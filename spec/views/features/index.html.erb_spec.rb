require 'rails_helper'

RSpec.describe "features/index", type: :view do
  before(:each) do
    assign(:features, [
      Feature.create!(
        :name => "Name",
        :project => nil,
        :min_days => 1,
        :max_days => 2
      ),
      Feature.create!(
        :name => "Name",
        :project => nil,
        :min_days => 1,
        :max_days => 2
      )
    ])
  end

  it "renders a list of features" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
