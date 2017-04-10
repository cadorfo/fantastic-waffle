require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:user) { create(:user) }
  describe "GET #index" do
    it "returns redirect if not signed_in" do
      get :index
      expect(response).to have_http_status(:redirect)
    end
    it "returns succes if signed_in" do
      @request.env["devise.mapping"] = Devise.mappings[:member]
      @user = create(:user)
      sign_in @user
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
