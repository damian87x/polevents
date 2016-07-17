require 'rails_helper'

RSpec.describe UserSerializer, :type => :serializer do

  subject { UserSerializer }
  it { should have_many(:filters) }

end

