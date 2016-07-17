class EventSerializer < ActiveModel::Serializer
  attributes *Event.serialize_methods

  def start_date
    object.send(__method__)
  end



  has_many :users,embed_in_root: false
end