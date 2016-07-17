require 'rails_helper'

RSpec.describe Filter, type: :model do

  describe 'should have relations' do

    it { should belong_to(:user) }
    it { should belong_to(:owner) }

  end



end
