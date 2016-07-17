require 'rails_helper'

RSpec.describe Topic, type: :model do
  describe 'should have relations' do

    it { should have_many(:events) }
    it { should have_many(:filters) }

  end

  describe 'should on create filters from topic model and expect to' do
    let(:topic) { FactoryGirl.create(:topic) }
    let(:user) { FactoryGirl.create(:user) }


    it 'be valid' do
      expect(topic.filters.create(user_id: user.id)).to be_valid
    end

  end

end
