require 'rails_helper'

RSpec.describe "features/edit", type: :view do
  before(:each) do
    @feature = assign(:feature, Feature.create!(
      :name => "MyString",
      :project => nil,
      :min_days => 1,
      :max_days => 1
    ))
  end

  it "renders the edit feature form" do
    render

    assert_select "form[action=?][method=?]", feature_path(@feature), "post" do

      assert_select "input#feature_name[name=?]", "feature[name]"

      assert_select "input#feature_project_id[name=?]", "feature[project_id]"

      assert_select "input#feature_min_days[name=?]", "feature[min_days]"

      assert_select "input#feature_max_days[name=?]", "feature[max_days]"
    end
  end
end
