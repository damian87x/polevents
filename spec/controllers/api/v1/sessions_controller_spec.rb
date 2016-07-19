require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do



  describe "GET #create" do
    let(:user) { FactoryGirl.create(:user) }

    it "returns http success" do
      get :create, params: {password: user.password, email: user.email}
      expect(response).to have_http_status(:success)
    end
  end

end
