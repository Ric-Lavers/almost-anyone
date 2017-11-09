require 'rails_helper'

RSpec.describe "offers/index", type: :view do
  before(:each) do
    assign(:offers, [
      Offer.create!(
        :tour => nil,
        :user => nil,
        :price => 2,
        :location => "Location"
      ),
      Offer.create!(
        :tour => nil,
        :user => nil,
        :price => 2,
        :location => "Location"
      )
    ])
  end

  it "renders a list of offers" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
  end
end
