module User::Relations
  extend ActiveSupport::Concern

  included do
    has_many :created_events, class_name: 'Event'

    has_many :users_events

    has_many :discussion_topics

    has_many :events, through: "users_events", source: :event

    has_many :filters
  end



end