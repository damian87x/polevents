require 'rails_helper'

RSpec.describe UsersEvent, type: :model do

  describe 'when relations' do
    it { should have_many(:user) }
    it { should have_many(:event) }
  end

  describe 'when check validation' do

    it { should validate_presence_of(:event_id) }
    it { should validate_presence_of(:user_id) }
    it { should validate_uniqueness_of(:user_id) }

  end


end
