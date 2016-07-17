class EventSerializer < ActiveModel::Serializer


 has_many :users_events,  embed_in_root: false
end