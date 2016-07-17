class Event < ApplicationRecord

  validates :start_time, :name, presence: true

  belongs_to :user
  belongs_to :city
  belongs_to :topic

  has_many :users_events

  has_many :users, through: "users_events", source: :user




end
