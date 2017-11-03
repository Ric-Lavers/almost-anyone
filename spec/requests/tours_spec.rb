require 'rails_helper'

RSpec.describe "Tours", type: :request do
  describe "GET /tours" do
    it "works! (now write some real specs)" do
      get tours_path
      expect(response).to have_http_status(200)
    end
  end
end
