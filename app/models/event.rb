class Event < ApplicationRecord

  include *[
          Event::Relations,
          Event::DefMethods,
          Event::Validation
  ]




end
