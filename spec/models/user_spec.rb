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


end
