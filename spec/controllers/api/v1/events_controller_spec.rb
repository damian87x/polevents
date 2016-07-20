require 'rails_helper'

RSpec.describe Api::V1::EventsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:auth) { {'Authorization' => "#{user.id}"} }

  describe "GET #index" do

    before do
      3.times do
        FactoryGirl.create(:event)
      end
      get :index,params: nil, session: auth
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

  describe "GET #index filters" do

    before do
      3.times do
       @event = FactoryGirl.create(:event)
      end
      user = FactoryGirl.create(:user)
      get :index,params: {city_id: @event.city.id,
                          topic_id: @event.topic.id,
                          start_time: (@event.start_time + 1.hour).to_f},
                          session: auth
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


  describe "#create" do
    let(:user) { FactoryGirl.create(:user) }
    let(:event) { FactoryGirl.build(:event) }
    before do
      post :create, params: { event: event.attributes.symbolize_keys } , session: auth
      @json = JSON.parse(response.body)
    end

    it 'should respond success' do
      expect(response).to have_http_status(:success)
    end

    it 'should return same event name when is success' do
      expect(event.name).to eq(@json["event"]["name"])
    end

  end


  describe "#show" do
    let(:event) { FactoryGirl.create(:event) }
    before do
      get :show, params: {id: event.id}, session: auth
      @json = JSON.parse(response.body)
    end

    it 'should respond success' do
      expect(response).to have_http_status(:success)
    end

    it 'should return same event id when is success' do
      expect(event.id).to eq(@json["event"]["id"])
    end

  end


end
