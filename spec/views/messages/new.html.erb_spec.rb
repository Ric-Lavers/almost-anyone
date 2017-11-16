require 'rails_helper'

RSpec.describe "messages/new", type: :view do
  before(:each) do
    assign(:message, Message.new(
      :tour => nil,
      :offer => nil,
      :user => nil,
      :message => "MyText",
      :read => false
    ))
  end

  it "renders new message form" do
    render

    assert_select "form[action=?][method=?]", messages_path, "post" do

      assert_select "input[name=?]", "message[tour_id]"

      assert_select "input[name=?]", "message[offer_id]"

      assert_select "input[name=?]", "message[user_id]"

      assert_select "textarea[name=?]", "message[message]"

      assert_select "input[name=?]", "message[read]"
    end
  end
end
