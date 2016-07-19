require 'rails_helper'

RSpec.describe Api::V1::EventsController, type: :controller do

  describe "GET #index" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      3.times do
        FactoryGirl.create(:event)
      end
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
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

    it "expect to include column attributes" do
      Event.serialize_methods.each do |m|
        expect(@json['events'].first[m.to_s]).to be_truthy
      end
    end

  end

  # describe "#create" do
  #   let(:user) { FactoryGirl.create(:user) }
  #   let(:event) { FactoryGirl.build(:event) }
  #   before do
  #     post :create, event: event.attributes.symbolize_keys
  #     @json = JSON.parse(response.body)
  #   end
  #
  #   it 'should respond success' do
  #     expect(response).to have_http_status(:success)
  #   end
  #
  #   it 'should return same event name when is success' do
  #     expect(event.name).to eq(@json["event"]["name"])
  #   end
  #
  # end
  #
  #
  # describe "#show" do
  #   let(:event) { FactoryGirl.create(:event) }
  #   before do
  #     get :show, params: {id: event.id}
  #     @json = JSON.parse(response.body)
  #   end
  #
  #   it 'should respond success' do
  #     expect(response).to have_http_status(:success)
  #   end
  #
  #   it 'should return same event id when is success' do
  #     expect(event.id).to eq(@json["event"]["id"])
  #   end
  #
  # end
  #

end
