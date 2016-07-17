require 'rails_helper'

RSpec.describe Api::V1::EventsController, type: :controller do

  describe "GET #index" do
    before do
      3.times do
        FactoryGirl.create(:event)
      end
      get :index
      @json = JSON.parse(response.body)
    end

    it "returns http success and events" do
      expect(response).to have_http_status(:success)
      expect(@json['events'].present?).to be_truthy
    end

    it "expect to return users" do
      expect(@json['events'].first['users'].present?).to be_truthy
    end

    it "expect to return filters for users" do
      expect(@json['events'].first['users'].first['filters'].present?).to be_truthy
    end


  end


end
