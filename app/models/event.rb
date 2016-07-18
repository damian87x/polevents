class Event < ApplicationRecord

  extend *[SerializeMethods]

  include *[
          Event::Relations,
          Event::DefMethods,
          Event::Validation
  ]




end
