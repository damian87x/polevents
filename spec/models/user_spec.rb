require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryGirl.create(:user) }

  describe 'UUID' do

    it 'there should be an UUID generated if creating new users' do

    end

    it 'there is no UUID generation for a user with UUID set during creation' do

    end

    it 'once UUID is set, you cannot update it' do

    end



  end



end
