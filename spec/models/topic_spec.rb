require 'rails_helper'

RSpec.describe Topic, type: :model do
  describe 'should have relations' do

    it { should have_many(:events) }


  end
end
