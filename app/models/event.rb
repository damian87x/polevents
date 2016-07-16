class Event < ApplicationRecord

  validates :start_time, :name, presence: true

  belongs_to :user
  belongs_to :city
  belongs_to :topic




end
