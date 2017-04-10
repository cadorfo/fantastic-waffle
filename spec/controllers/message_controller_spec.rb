require 'rails_helper'

RSpec.describe MessageController, type: :controller do

  describe "POST #create" do
    it "returns http success" do
      @request.env["devise.mapping"] = Devise.mappings[:member]
      @user = create(:user)
      sign_in @user

      post :create, {
        message: {
          content: "My name is Carlos",
          message_type: "valley"
        }
      }
      puts response.body.inspect
      expect(response).to have_http_status(:success)
    end
  end

end
