class User < ApplicationRecord

  validate :id_not_changed

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :created_events, class_name: 'Event'

  has_many :users_events

  has_many :events, through: "users_events", source: :event

  private

  def id_not_changed
    if self.id_changed? and self.persisted?
      self.errors.add(:id, "id can't be updated")
    end
  end


end
