require 'rails_helper'

RSpec.describe EventSerializer, :type => :serializer do

  describe 'attributes' do

    let(:event) do
      build_serializable(
              :start_time => Date.today,
              :start_date => Date.today.strftime('%d/%m/%Y')

      )
    end

    subject { serialize(event) }

    it { expect(subject).to include(:start_time => Date.today) }
  end

  describe 'associations' do

    subject { EventSerializer }
    it { expect(subject).to  have_many(:users) }
  end

end

