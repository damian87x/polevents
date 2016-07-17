require 'rails_helper'

RSpec.describe UsersEvent, type: :model do

  describe 'when relations' do
    it { should belong_to(:user) }
    it { should belong_to(:event) }
  end

  describe 'when check validation' do

    it { should validate_presence_of(:event_id) }
    it { should validate_presence_of(:user_id) }
    # it { should validate_uniqueness_of(:event_id).scoped_to(:user_id) }

  end


  describe 'should on create users from event model and expect to' do


    let(:event) { FactoryGirl.create(:event) }

    it 'be valid' do
      expect(event.users.create(email: 'test@test.uk', password: '123455678')).to be_valid
    end

  end



end
