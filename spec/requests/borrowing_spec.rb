require 'rails_helper'

RSpec.describe "Borrowings", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/borrowing/show"
      expect(response).to have_http_status(:success)
    end
  end

end
