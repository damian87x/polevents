class City < ApplicationRecord

  has_many :events
  has_many :filters, as: :owner

  class << self

    def serialize_methods
      %i{name id}
    end

  end

end
