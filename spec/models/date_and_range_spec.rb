require 'rails_helper'

RSpec.describe DateAndRange, type: :model do

  describe 'should have relations' do

    it { should have_many(:filters) }

  end

  describe 'should on create filters from city model and expect to' do
    let(:date_and_range) { FactoryGirl.create(:date_and_range) }
    let(:user) { FactoryGirl.create(:user) }


    it 'be valid' do
      expect(date_and_range.filters.create(user_id: user.id)).to be_valid
    end

    it "name should be readonly" do
      date_and_range.update_attributes(name: 'TryToChange')
      expect(date_and_range.reload.name).to eq('DateAndRange')
    end

  end




end
