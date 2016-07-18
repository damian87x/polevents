require 'rails_helper'

RSpec.describe Api::V1::CitiesController, type: :controller do

  describe "GET #index" do
    before do
      3.times do
        FactoryGirl.create(:city)
      end
      get :index
      @json = JSON.parse(response.body)
    end

    it "should returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "should return cites" do
      expect(@json['cities']).to be_truthy
    end

    it "should return cites" do
      expect(@json['cities'].count).to eq(3)
    end

  end

end
