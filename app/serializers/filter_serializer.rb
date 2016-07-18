class FilterSerializer < ActiveModel::Serializer
  include BelongsToSerializer
  attributes *Filter.serialize_methods



end