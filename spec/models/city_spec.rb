require 'rails_helper'

RSpec.describe City, type: :model do


  describe 'should have relations' do

    it { should have_many(:events) }


  end

end