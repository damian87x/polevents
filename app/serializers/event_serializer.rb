class EventSerializer < ActiveModel::Serializer
  attribute :start_time

  def start_date
    object.send(__method__)
  end



  has_many :users_events,embed_in_root: false
end