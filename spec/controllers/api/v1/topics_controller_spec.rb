require 'rails_helper'

RSpec.describe Api::V1::TopicsController, type: :controller do

  describe "GET #index" do
    before do
      3.times do
        FactoryGirl.create(:topic)
      end
      get :index
      @json = JSON.parse(response.body)
    end

    it "should returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "should return cites" do
      expect(@json['topics']).to be_truthy
    end

    it "should return cites" do
      expect(@json['topics'].count).to eq(3)
    end

    it "expect to include column attributes" do
      Topic.serialize_methods.each do |m|
        expect(@json['topics'].first[m.to_s]).to be_truthy
      end
    end

  end

end
