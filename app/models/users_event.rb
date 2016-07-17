class UsersEvent < ApplicationRecord

  validates_presence_of :event_id, :user_id
  validates_uniqueness_of :event_id, scope: [:user_id]

  belongs_to :user
  belongs_to :event


end
