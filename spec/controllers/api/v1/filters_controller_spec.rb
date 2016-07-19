require 'rails_helper'

RSpec.describe Api::V1::FiltersController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:auth) { {'Authorization' => "#{user.id}"} }


  describe "GET #index" do
    before do
      3.times do
        user.filters << FactoryGirl.create(:filter)
      end
      get :index, params: nil , session: auth
      @json = JSON.parse(response.body)
    end

    it "returns http success and events" do
      expect(response).to have_http_status(:success)
      expect(@json['filters'].present?).to be_truthy
    end

    it "expect to include column attributes" do
      Filter.serialize_methods.each do |m|
        expect(@json['filters'].first[m.to_s]).to be_truthy
      end
    end

  end

  describe "#create" do
    let(:filter) { FactoryGirl.build(:filter) }
    before do
      owner = FactoryGirl.create(:topic)
      filter.owner_id = owner.id
      filter.user_id = FactoryGirl.create(:user).id
      filter.owner_type = owner.class
      post :create,  params:{ filter: filter.attributes.symbolize_keys }, session: auth
      @json = JSON.parse(response.body)
    end

    it 'should respond success' do
      expect(response).to have_http_status(:success)
    end

    it 'should return same event name when is success' do
      expect(filter.user_id).to eq(@json["filter"]['user']["id"])
    end

  end


  describe "#upate" do
    let(:filter) { FactoryGirl.create(:filter) }
    before do
      put :update, params:{ id: filter.id, filter: filter.attributes.symbolize_keys }, session: auth
      @json = JSON.parse(response.body)
    end

    it 'should respond success' do
      expect(response).to have_http_status(:success)
    end

    it 'should return same event name when is success' do
      expect(filter.owner_id).to eq( @json['filter']['owner']["id"])
    end

  end



end
