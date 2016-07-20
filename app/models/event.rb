class Event < ApplicationRecord

  extend *[SerializeMethods]

  include *[
          Event::Relations,
          Event::DefMethods,
          Event::Validation
  ]


  after_create :notify_users

  scope :search_all, -> { includes(self.include_list) }
  scope :search_by_filters, ->(params) { includes(Event.include_list).where(["start_time < ? AND city_id = ? AND topic_id = ? ", Time.at(Event.con_time(params[:start_time])),params[:city_id], params[:topic_id]])}

  def self.include_list
    [:city,:user, :topic,:discussion_topics,:users => [:filters]]
  end

  def self.con_time(time)
    case time
      when Time
        time
      when String
        time.to_f
    end
  end

  def to_filter_conditions
    {city_id: city_id, topic_id: topic_id}
  end

  private

  def notify_users
   fork { Notify.new { |n| n.event = Event.last } } unless Rails.env.test?
  end


end
