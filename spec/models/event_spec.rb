require 'rails_helper'

RSpec.describe Event, type: :model do

  describe 'should has relations' do

    it { should belong_to(:user) }
    it { should belong_to(:city) }
    it { should belong_to(:category) }

  end




end
