module Event::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :user
    belongs_to :city
    belongs_to :topic

    has_many :users_events

    has_many :users, through: "users_events", source: :user
  end
end