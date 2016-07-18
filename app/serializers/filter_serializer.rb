class FilterSerializer < ActiveModel::Serializer
  include BelongsToSerializer
  attributes *Filter.serialize_methods

  def self.serialize_methods
   Filter.belongs_to_list.map(&:to_sym)
  end

end