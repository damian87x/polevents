class UserSerializer < ActiveModel::Serializer

  has_many :filters
end