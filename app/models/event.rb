class Event < ApplicationRecord

  include *[
          Event::Relations,
            Event::Validation
  ]






end
