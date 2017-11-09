require 'rails_helper'

RSpec.describe "offers/edit", type: :view do
  before(:each) do
    @offer = assign(:offer, Offer.create!(
      :tour => nil,
      :user => nil,
      :price => 1,
      :location => "MyString"
    ))
  end

  it "renders the edit offer form" do
    render

    assert_select "form[action=?][method=?]", offer_path(@offer), "post" do

      assert_select "input[name=?]", "offer[tour_id]"

      assert_select "input[name=?]", "offer[user_id]"

      assert_select "input[name=?]", "offer[price]"

      assert_select "input[name=?]", "offer[location]"
    end
  end
end
