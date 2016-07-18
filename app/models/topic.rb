class Topic < ApplicationRecord
  extend OwnerGroupSerializer

  has_many :events
  has_many :filters, as: :owner

end
