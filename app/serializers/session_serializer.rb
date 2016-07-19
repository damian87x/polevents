class SessionSerializer < ActiveModel::Serializer

  attributes :email,  :user_id

  def user_id
    object.id
  end


end