require 'rails_helper'

RSpec.describe City, type: :model do


  describe 'should have relations' do

    it { should have_many(:events) }
    it { should have_many(:filters) }


  end

  describe 'should on create filters from city model and expect to' do
    let(:city) { FactoryGirl.create(:city) }
    let(:user) { FactoryGirl.create(:user) }


    it 'be valid' do
      expect(city.filters.create(user_id: user.id)).to be_valid
    end

  end


end
