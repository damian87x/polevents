class DateAndRange < ApplicationRecord
  attr_readonly :name
  has_many :filters, as: :owner

end
