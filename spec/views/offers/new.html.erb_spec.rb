require 'rails_helper'

RSpec.describe "offers/new", type: :view do
  before(:each) do
    assign(:offer, Offer.new(
      :tour => nil,
      :user => nil,
      :price => 1,
      :location => "MyString"
    ))
  end

  it "renders new offer form" do
    render

    assert_select "form[action=?][method=?]", offers_path, "post" do

      assert_select "input[name=?]", "offer[tour_id]"

      assert_select "input[name=?]", "offer[user_id]"

      assert_select "input[name=?]", "offer[price]"

      assert_select "input[name=?]", "offer[location]"
    end
  end
end
