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

  describe 'validations' do

    let(:new_event) { Event.create }

    it "should name not be empty" do
      expect(new_event.errors[:name]).to include("can't be blank")
    end

    it "should start time not be empty" do
      expect(new_event.errors[:start_time]).to include("can't be blank")
    end

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:start_time) }

  end






end
