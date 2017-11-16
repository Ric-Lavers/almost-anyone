require 'rails_helper'

RSpec.describe "messages/edit", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      :tour => nil,
      :offer => nil,
      :user => nil,
      :message => "MyText",
      :read => false
    ))
  end

  it "renders the edit message form" do
    render

    assert_select "form[action=?][method=?]", message_path(@message), "post" do

      assert_select "input[name=?]", "message[tour_id]"

      assert_select "input[name=?]", "message[offer_id]"

      assert_select "input[name=?]", "message[user_id]"

      assert_select "textarea[name=?]", "message[message]"

      assert_select "input[name=?]", "message[read]"
    end
  end
end
