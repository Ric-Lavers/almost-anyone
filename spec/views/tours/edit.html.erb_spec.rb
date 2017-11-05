require 'rails_helper'

RSpec.describe "tours/edit", type: :view do
  before(:each) do
    @tour = assign(:tour, Tour.create!(
      :user => nil,
      :title => "MyString",
      :description => "MyText",
      :country => "MyString",
      :image_data => "MyText",
      :bio => "MyText",
      :min_cost => 1,
      :max_cost => 1
    ))
  end

  it "renders the edit tour form" do
    render

    assert_select "form[action=?][method=?]", tour_path(@tour), "post" do

      assert_select "input[name=?]", "tour[user_id]"

      assert_select "input[name=?]", "tour[title]"

      assert_select "textarea[name=?]", "tour[description]"

      assert_select "input[name=?]", "tour[country]"

      assert_select "textarea[name=?]", "tour[image_data]"

      assert_select "textarea[name=?]", "tour[bio]"

      assert_select "input[name=?]", "tour[min_cost]"

      assert_select "input[name=?]", "tour[max_cost]"
    end
  end
end
