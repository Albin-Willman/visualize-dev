require 'rails_helper'

RSpec.describe "features/new", type: :view do
  before(:each) do
    assign(:feature, Feature.new(
      :name => "MyString",
      :project => nil,
      :min_days => 1,
      :max_days => 1
    ))
  end

  it "renders new feature form" do
    render

    assert_select "form[action=?][method=?]", features_path, "post" do

      assert_select "input#feature_name[name=?]", "feature[name]"

      assert_select "input#feature_project_id[name=?]", "feature[project_id]"

      assert_select "input#feature_min_days[name=?]", "feature[min_days]"

      assert_select "input#feature_max_days[name=?]", "feature[max_days]"
    end
  end
end
