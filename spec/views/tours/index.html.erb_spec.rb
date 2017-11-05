require 'rails_helper'

RSpec.describe "tours/index", type: :view do
  before(:each) do
    assign(:tours, [
      Tour.create!(
        :user => nil,
        :title => "Title",
        :description => "MyText",
        :country => "Country",
        :image_data => "MyText",
        :bio => "MyText",
        :min_cost => 2,
        :max_cost => 3
      ),
      Tour.create!(
        :user => nil,
        :title => "Title",
        :description => "MyText",
        :country => "Country",
        :image_data => "MyText",
        :bio => "MyText",
        :min_cost => 2,
        :max_cost => 3
      )
    ])
  end

  it "renders a list of tours" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
