require 'rails_helper'

RSpec.describe "tours/show", type: :view do
  before(:each) do
    @tour = assign(:tour, Tour.create!(
      :user => nil,
      :title => "Title",
      :description => "MyText",
      :country => "Country",
      :image_data => "MyText",
      :bio => "MyText",
      :min_cost => 2,
      :max_cost => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
