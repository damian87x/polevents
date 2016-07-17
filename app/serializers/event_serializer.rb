class EventSerializer < ActiveModel::Serializer
  attribute :start_time



  has_many :users_events
end