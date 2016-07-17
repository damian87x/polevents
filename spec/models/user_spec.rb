require 'rails_helper'

RSpec.describe User, type: :model do


  describe 'ID' do


    describe 'when create' do
      let(:user_one) { FactoryGirl.create(:user) }
      let(:user_two) { FactoryGirl.create(:user) }

      it 'there should be an ID different if creating new users' do
        expect(user_one.id != user_two.id).to be_truthy
      end

      it 'there should be an ID not blank for users' do
        expect(user_one.id && user_two.id).to be_truthy
      end


    end

    describe 'when update' do
      let(:user_update) { FactoryGirl.create(:user) }

      it 'once ID is set, you cannot update it' do
        user_update.update_attributes(id: SecureRandom.uuid)
        expect(user_update).to be_invalid
        expect(user_update.errors[:id]).to include("id can't be updated")
      end


    end


  end

  describe 'should have relations' do

    it { should have_many(:created_events) }
    it { should have_many(:users_events) }
    it { should have_many(:events) }

  end

  describe 'should on create events from user model and expect to' do

    let(:user_update) { FactoryGirl.create(:user) }
    let(:city) { FactoryGirl.create(:city) }
    let(:topic) { FactoryGirl.create(:topic) }

    it 'be valid' do
      expect(user_update.events.create(city_id: city.id,
                                       topic_id: topic.id ,
                                       name: 'Crazy programming',
                                       start_time: Time.now,
                                       user_id: user_update.id)).to be_valid
    end

  end


end
