require 'rails_helper'

RSpec.describe DiscussionTopic, type: :model do

  describe 'should have relations' do

    it { should belong_to(:event) }
    it { should belong_to(:user) }

  end

  describe 'should on create events from user model and expect to' do

    let(:user) { FactoryGirl.create(:user) }
    let(:event) { FactoryGirl.create(:event) }

    it 'be valid' do
      expect(event.discussion_topics.create(user_id: user.id,
                                event_id: event.id,
                                name: 'Test')).to be_valid
    end

  end


end
