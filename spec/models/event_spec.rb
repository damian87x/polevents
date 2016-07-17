require 'rails_helper'

RSpec.describe Event, type: :model do

  describe 'should has relations' do

    it { should belong_to(:user) }
    it { should belong_to(:city) }
    it { should belong_to(:topic) }
    it { should have_many(:users_events) }
    it { should have_many(:users) }

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

    it "should start time not be empty" do
      expect(new_event.errors[:end_time]).to include("can't be blank")
    end

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:end_time) }


  end

  describe 'methods' do
    let(:event) { FactoryGirl.create(:event) }

    it "Should return start date" do
      expect(event.start_date == event.start_time.strftime('%d/%m/%Y')).to be_truthy
    end

    it "should return belongs_to list" do
      expect(Event.belongs_to_list).to eq(%w{user city topic})
    end

    it "should return serialize attributes" do
      expect(Event.serialize_methods).to eq(%i{id start_time end_time start_date user city topic})
    end




  end





end
