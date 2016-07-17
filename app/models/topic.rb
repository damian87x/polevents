class Topic < ApplicationRecord

  has_many :events
  has_many :filters, as: :owner

end
