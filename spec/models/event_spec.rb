require 'rails_helper'

RSpec.describe Event, type: :model do

  describe 'should has relations' do

    it { should belong_to(:user) }
    it { should belong_to(:city) }
    it { should belong_to(:topic) }

  end

  describe 'should on create' do

    let(:event) { FactoryGirl.create(:event) }

    it 'be valid after' do
      expect(event).to be_valid
    end

  end






end
