class CitySerializer < ActiveModel::Serializer
  attributes *City.serialize_methods

end