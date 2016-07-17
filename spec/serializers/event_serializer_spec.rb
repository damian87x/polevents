require 'rails_helper'

RSpec.describe EventSerializer, :type => :serializer do

  subject { EventSerializer }
  it { should have_many(:users_events) }

end

