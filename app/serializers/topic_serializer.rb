class TopicSerializer < ActiveModel::Serializer
  attributes *Topic.serialize_methods

end