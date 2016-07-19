class Event < ApplicationRecord

  extend *[SerializeMethods]

  include *[
          Event::Relations,
          Event::DefMethods,
          Event::Validation
  ]


  after_create :notify_users

  def to_filter_conditions
    {city_id: city_id, topic_id: topic_id}
  end

  private

  def notify_users
   fork { Notify.new { |n| n.event = Event.last } } unless Rails.env.test?
  end


end
